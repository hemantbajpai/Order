package order

import grails.plugin.springsecurity.SpringSecurityService
import grails.test.mixin.*
import spock.lang.*

@TestFor(MyOrderController)
@Mock([MyOrder, Item, User])
class MyOrderControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        controller.springSecurityService = new SpringSecurityService()
        User user = new User(username: 'user', password: 'secret', firstName: "admin", lastName: "admin", addressLine1: "10 pl st", addressLine2: "apt#10", city: "arlington", state: "MA", zipcode: "02476", creditCard: "4488741235762723", expiryDate: new Date(2017, 12, 12), orders: [], enabled: true)
        controller.springSecurityService.metaClass.getCurrentUser = { -> return user }
        params << [dateCreated: new Date(), lastUpdated: new Date(), datePurchased: new Date(), user: user, items:[], currentPrice: true]
    }

    void "Test the signup" () {

        when:"The signup is executed"
            controller.signup()

        then: "The model is correct"
            view == "/myOrder/signup"
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def myOrder = new MyOrder(params)
            controller.show(myOrder)

        then:"A model is populated containing the domain instance"
            model.myOrder == myOrder
    }

    void "Test that changeSize returns the correct model" () {
        when:
            populateValidParams(params)
            def myOrder = new MyOrder(params)
            Item item = new Item(name:"name", currentPrice: 4, price: 4, size:"medium", quantity: 1, order: myOrder, showItem: true)
            myOrder.items << item
            myOrder.save(flush:true)
            controller.changeSize(item, "large")
        then:
            response.json.price == 5
            response.json.object.currentPrice == 5
    }

    void "Test that changeQuantity returns the correct model" () {
        when:
            populateValidParams(params)
            def myOrder = new MyOrder(params)
            Item item = new Item(name:"name", currentPrice: 4, price: 4, size:"medium", quantity: 1, order: myOrder, showItem: true)
            myOrder.items << item
            myOrder.save(flush:true)
            controller.changeQuantity(item, 2)
        then:
            response.json.price == 8
            response.json.object.currentPrice == 8
    }

    void "Test that deleteItem returns the correct model" () {
        when:
            populateValidParams(params)
            def myOrder = new MyOrder(params)
            Item item = new Item(name:"name", currentPrice: 4, price: 4, size:"medium", quantity: 1, order: myOrder, showItem: true)
            myOrder.items << item
            myOrder.save(flush:true)
            controller.deleteItem(item)
        then:
            response.json.price == 0
    }

    void "Test orderhistory action of controller" () {
        when:
            populateValidParams(params)
            def myOrder = new MyOrder(params)
            myOrder.save(flush:true)
            myOrder.user.orders << myOrder
            controller.orderhistory()
        then:
            view == "/myOrder/orderhistory"
            model.orders.size() == 1
    }

    void "Test createAccount action of controller" () {
        when:
            params << [username: 'user', password: 'secret', firstName: "admin", lastName: "admin", addressLine1: "10 pl st", addressLine2: "apt#10", city: "arlington", state: "MA", zipcode: "02476", creditCard: "4488741235762723", expiryDate: "2017-12-10", orders: [], enabled: true]
            controller.createAccount()
        then:
            view == "/myOrder/createAccount"
    }

    void "Test addToOrder action of controller" () {
        when:
            populateValidParams(params)
            params << [name:"name", price:5]
            controller.addToOrder()
        then:
            view == "/myOrder/show"
            model.myOrder.items[0].name == "name"
            model.myOrder.items[0].price == 5

    }

    void "Test myCurrentOrder action" () {
        when:
            populateValidParams(params)
            controller.myCurrentOrder()
        then:
            view=="/myOrder/show"
            model.myOrder
    }

    void "Test submitOrder action" () {
        when:
            populateValidParams(params)
            def myOrder = new MyOrder(params)
            myOrder.save(flush:true)
            params << [id:1, username: 'user', password: 'secret', firstName: "admin", lastName: "admin", addressLine1: "10 pl st", addressLine2: "apt#10", city: "arlington", state: "MA", zipcode: "02476", creditCard: "4488741235762723", expiryDate: "2017-12-10", orders: [], enabled: true]
            controller.submitOrder()
        then:
            view == "/myOrder/confirmation"
    }
}
