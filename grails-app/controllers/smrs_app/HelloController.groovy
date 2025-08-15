package smrs_app
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import smrs_app.Url
import grails.gorm.transactions.Transactional



class HelloController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def beforeInterceptor = {
        if (!session.user) {
            redirect(controller: 'login', action: 'login')
            return false
        }
    }


    def overview(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def urlList = Url.list(params)
        [urlList: urlList, urlCount: Url.count(), msg: " Ini halaman overview"]
    }

    def monitored() {
        // Ambil semua data URL dari database untuk ditampilkan
        def urlList = Url.list()
        [urlList: urlList, msg: "Ini halaman monitored sites"]
    }

    def report() {
        [msg: "Ini halaman report issues"]
    }

    def add() {
        [url: new Url(params)]
    }

    @Transactional
    def save() {
        def url = new Url()
        url.name = params.urlName
        url.url = params.url

        if (url.save(flush: true)) {
            flash.message = "Website '${url.name}' berhasil disimpan"
        } else {
            flash.error = "Gagal menyimpan data"
        }

        redirect(controller:'hello',action: 'monitored')

    }

    def edit(Long id) {
        def url = Url.get(id)
        if (!url) {
            notFound()
            return
        }
        [url: url]
    }

    @Transactional
    def update(Long id) {
        def url = Url.get(id)
        if (!url) {
            notFound()
            return
        }

        url.name = params.name
        url.url = params.url

        if (url.save(flush: true)) {
            flash.message = "Website '${url.name}' berhasil diupdate"
            redirect(action: 'monitored')
        } else {
            flash.error = "Gagal mengupdate data"
            render(view: 'edit', model: [url: url])
        }

    }

    @Transactional
    def delete(Long id) {
        def url = Url.get(id)
        if (url == null) {
            notFound()
            return
        }

        url.delete(flush: true)
        flash.message = "Website berhasil dihapus"
        redirect(controller: 'hello', action: 'monitored')
    }

    protected void notFound() {
        flash.message = "Website tidak ditemukan"
        redirect(controller: 'hello', action: 'monitored')
    }
}
