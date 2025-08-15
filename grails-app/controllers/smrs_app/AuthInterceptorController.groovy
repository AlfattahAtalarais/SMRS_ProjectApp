// File: grails-app/controllers/smrs_app/AuthInterceptor.groovy
package smrs_app

class AuthInterceptor {

    int order = 100

    AuthInterceptor() {
        matchAll()
                .excludes(controller: 'login') // Kecualikan login controller
                .excludes(controller: 'error') // Kecualikan error controller
    }

    boolean before() {
        def user = session.user

        if (!user) {
            log.info("User not logged in, redirecting to login page")
            redirect(controller: 'login', action: 'login')
            return false // Stop request processing
        }

        log.info("User ${user.email} is authenticated")
        return true
    }


}