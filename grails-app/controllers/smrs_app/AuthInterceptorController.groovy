// File: grails-app/controllers/smrs_app/AuthInterceptor.groovy
package smrs_app

class AuthInterceptor {

    // Tentukan prioritas interceptor (semakin rendah semakin tinggi prioritas)
    int order = 100

    // Apply interceptor ke semua controller kecuali login
    AuthInterceptor() {
        matchAll()
                .excludes(controller: 'login') // Kecualikan login controller
                .excludes(controller: 'error') // Kecualikan error controller
    }

    boolean before() {
        // Check apakah user sudah login
        def user = session.user

        if (!user) {
            // User belum login, redirect ke halaman login
            log.info("User not logged in, redirecting to login page")
            redirect(controller: 'login', action: 'login')
            return false // Stop request processing
        }

        // User sudah login, lanjutkan request
        log.info("User ${user.email} is authenticated")
        return true
    }

    boolean after() {
        // Optional: Logic setelah action dieksekusi
        return true
    }

    void afterView() {
        // Optional: Logic setelah view di-render
    }
}