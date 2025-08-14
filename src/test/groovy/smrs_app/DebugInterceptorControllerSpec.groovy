package smrs_app

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class DebugInterceptorControllerSpec extends Specification implements ControllerUnitTest<DebugInterceptorController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
