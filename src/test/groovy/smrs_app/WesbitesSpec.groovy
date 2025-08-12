package smrs_app

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class WesbitesSpec extends Specification implements DomainUnitTest<Wesbites> {

     void "test domain constraints"() {
        when:
        Wesbites domain = new Wesbites()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
