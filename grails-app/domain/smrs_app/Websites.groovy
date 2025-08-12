package smrs_app

class Url {

    String nameWebsite
    String url

    static constraints = {
        nameWebsite nullable: false, blank: false, maxSize: 255
        url nullable: false, blank: false, maxSize: 255
    }
}
