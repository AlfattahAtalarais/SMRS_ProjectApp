package smrs_app

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {

            }
        }

        "/"(controller: 'hello', action: 'overview')
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
