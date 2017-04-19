package order

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(MyOrder)
class MyOrderSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "MyOrder should have a order"() {
        when:
            MyOrder order = new MyOrder(dateCreated: new Date(), lastUpdated: new Date())
            order.save(flush: true)
        then:
            !order.validate()
        when:
            order.user = new User()
            order.save(flush:true)
        then:
            order.validate()
    }
}
