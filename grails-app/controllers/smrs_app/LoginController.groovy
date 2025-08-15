package smrs_app

import grails.converters.JSON
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier
import com.google.api.client.http.javanet.NetHttpTransport
import com.google.api.client.json.gson.GsonFactory

class LoginController {

    def login() {
        // Check apakah user sudah login
        if (session.user) {
            // Jika sudah login, redirect ke overview
            redirect(controller: 'hello', action: 'overview')
            return
        }

        // Tampilkan halaman login
        render(view: 'login')
    }

    def googleCallback() {
        try {
            def requestBody = request.JSON
            def tokenString = requestBody?.credential

            if (!tokenString) {
                log.error("Token tidak ditemukan dalam request")
                render([success: false, message: "Token tidak ditemukan"] as JSON)
                return
            }

            // Verifikasi Google ID Token
            def verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new GsonFactory())
                    .setAudience(["40581836864-3bu5riuquuir497l491vslm6rfvibk42.apps.googleusercontent.com"])
                    .build()

            GoogleIdToken idToken = verifier.verify(tokenString)

            if (idToken) {
                def payload = idToken.getPayload()
                def email = payload.getEmail()
                def name = payload.get("name")
                def picture = payload.get("picture")
                def emailVerified = payload.getEmailVerified()

                // Validasi tambahan
                if (!emailVerified) {
                    log.error("Email not verified for user: ${email}")
                    render([success: false, message: "Email belum terverifikasi"] as JSON)
                    return
                }

                // Simpan user data ke session
                session.user = [
                        email: email,
                        name: name,
                        picture: picture,
                        loginTime: new Date(),
                        tokenString: tokenString // Simpan untuk keperluan logout
                ]

                log.info("User ${email} berhasil login")
                render([success: true, message: "Login berhasil"] as JSON)

            } else {
                log.error("Token Google tidak valid")
                render([success: false, message: "Token tidak valid"] as JSON)
            }

        } catch (Exception e) {
            log.error("Error saat verifikasi Google token: ${e.message}", e)
            render([success: false, message: "Terjadi kesalahan saat login"] as JSON)
        }
    }

    def logout() {
        def user = session.user

        if (user) {
            log.info("User ${user.email} logout")
        }

        // Hapus session
        session.invalidate()

        // Redirect ke login dengan pesan
        flash.message = "Anda telah berhasil logout"
        redirect(action: 'login')
    }

    // Method untuk check status login (optional, untuk AJAX calls)
    def checkAuth() {
        def user = session.user

        if (user) {
            render([
                    authenticated: true,
                    user: [
                            email: user.email,
                            name: user.name,
                            picture: user.picture,
                            loginTime: user.loginTime
                    ]
            ] as JSON)
        } else {
            render([authenticated: false] as JSON)
        }
    }
}