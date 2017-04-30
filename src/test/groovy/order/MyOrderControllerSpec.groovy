package order

import grails.test.mixin.*
import spock.lang.*

@TestFor(MyOrderController)
@Mock(MyOrder)
class MyOrderControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        params << [dateCreated: new Date(), lastUpdated: new Date(), datePurchased: new Date(), user: new User()]
    }

    void "Test the signup" () {

        when:"The signup is executed"
            controller.signup()

        then: "The model is correct"
            view == "/myOrder/signup"
    }
}
