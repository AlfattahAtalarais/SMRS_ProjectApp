package smrs_app
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class HelloController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def overview(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Url.list(params), model:[urlCount: Url.count()]

        [msg: "Ini halaman overview"]
    }

    def monitored() {
        [msg: "Ini halaman monitored sites"]
    }

    def report() {
        [msg: "Ini halaman report issues"]
    }

    def add() {
        respond new Url(params)
    }

    def save(Url url) {
        if (url == null) {
            notFound()
            return
        }

        try {
            url.save(flush: true)
        } catch (ValidationException e) {
            respond url.errors, view:'create'
            return
        }

        flash.message = "Url '${url.title}' created successfully"
        redirect action: "show", id: url.id
    }

    def edit(Long id) {
        respond Url.get(id)
    }

    def update(Url url) {
        if (url == null) {
            notFound()
            return
        }

        try {
            url.save(flush: true)
        } catch (ValidationException e) {
            respond url.errors, view:'edit'
            return

        }

        flash.message = "Url '${url.title}' updated successfully"
        redirect action: "show", id: url.id
    }

    def delete(Long id) {
        def url = Url.get(id)
        if (url == null) {
            notFound()
            return
        }

        url.delete(flush: true)
        flash.message = "Url deleted successfully"
        redirect action: "index"
    }

    protected void notFound() {
        flash.message = "Url not found with id ${params.id}"
        redirect action: "index"
    }
}

