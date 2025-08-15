package smrs_app

class UrlMappings {
    static mappings = {
        // General controller/action mapping
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // Add any constraints here if needed
            }
        }

        // Public routes (tidak perlu login)
        "/"(controller: 'login', action: 'login')
        "/login"(controller: 'login', action: 'login')
        "/login/googleCallback"(controller: 'login', action: 'googleCallback')
        "/login/checkAuth"(controller: 'login', action: 'checkAuth')

        // Logout route
        "/logout"(controller: 'login', action: 'logout')

        // Protected routes (perlu login) - handled by AuthInterceptor
        "/overview"(controller: 'hello', action: 'overview')
        "/hello/$action?/$id?(.$format)?"(controller: 'hello')
        "/monitored/$action?/$id?(.$format)?"(controller: 'monitored')

        // Error pages
        "500"(view: '/error')
        "404"(view: '/notFound')
        "403"(view: '/forbidden') // Tambahan untuk unauthorized access
    }
}