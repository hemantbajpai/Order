package order

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Item)
class ItemSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "item should hava 1 quantity"() {
        when:
            Item item = new Item(name:"name", price: 5, size: "small", quantity: 0, order: new MyOrder())
            item.save(flush: true)
        then:
            !item.validate()
        when:
            item.quantity = 1
            item.save(flush: true)
        then:
            item.validate()
    }

    void "item size should be small, medium or large" () {
        when:
            Item item = new Item(name:"name", price: 5,  size: "random", quantity: 1, order: new MyOrder())
            item.save(flush: true)
        then:
            !item.validate()
        when:
            item.size = "small"
            item.save(flush:true)
        then:
            item.validate()
        when:
            item.size = "medium"
            item.save(flush:true)
        then:
            item.validate()
        when:
            item.size = "large"
            item.save(flush: true)
        then:
            item.validate()
    }

    void "item should belong to order" () {
        when:
            Item item = new Item(name:"name", price: 5, size: "small", quantity: 1)
            item.save(flush: true)
        then:
            !item.validate()
        when:
            item.order = new MyOrder()
            item.save(flush: true)
        then:
            item.validate()
    }
}
