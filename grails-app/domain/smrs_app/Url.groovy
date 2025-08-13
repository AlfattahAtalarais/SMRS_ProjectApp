package smrs_app

class Url {
    String name
    String url
    Date lastChecked = new Date()

    static constraints = {
        name blank: false, maxSize: 255
        url blank: false, maxSize: 1000
        lastChecked nullable: false
    }

    String toString() {
        return urlName
    }
}