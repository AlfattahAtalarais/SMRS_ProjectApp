package smrs_app

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class UrlSpec extends Specification implements DomainUnitTest<Url> {

     void "test domain constraints"() {
        when:
        Url domain = new Url()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
