package order

import grails.test.mixin.*
import spock.lang.*

@TestFor(MyOrderController)
@Mock(MyOrder)
class MyOrderControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        params << [dateCreated: new Date(), lastUpdated: new Date(), datePurchased: new Date(), user: new User(), items:[]]
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
}
