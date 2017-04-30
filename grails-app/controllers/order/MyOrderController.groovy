package order

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('permitAll')
class MyOrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def changeQuantity() {
        string str = params.input
    }

    def signup() {
        render view:'signup'
    }

    @Transactional
    def createAccount() {
        User user = new User(username: params.username, password: params.password, firstName: params.firstName, lastName: params.lastName, addressLine1: params.addressLine1, addressLine2: params.addressLine2, city: params.city, state: params.state, zipcode: params.zipcode, creditCard: params.creditCard, expiryDate: params.expiryDate? Date.parse("yyyy-MM-dd", params.expiryDate):null, enabled: true)

        if (user.validate()) {
            user.save(flush: true, failOnError: true)

            Role userRole = Role.findByAuthority(Role.ROLE_USER)
            //UserRole.create(user, userRole)
            render view: 'createAccount'
        }
        else {
            render view:"signup", model:[user: user]
        }
    }

    def addToOrder() {
        User user = springSecurityService.getCurrentUser()

        if(user == null){
            user = User.findByUsername("admin")
        }

        MyOrder order = user.getCurrentOrder()

        if(order == null) {
            order = new MyOrder(dateCreated: new Date(), lastUpdated: new Date(), currentOrder: true, grandTotal: 0, user: user, items: [])
            order.save(flush:true, failOnError:true)
            user.orders << order
            user.save(flush:true, failOnError:true)
        }

        Item item = new Item(name: params.name, price: params.price, size: "medium", quantity: 1, order: order)
        item.save(flush:true, failOnError:true)
        order.items << item
        order.save(flush:true, failOnError:true)

        render view:'show', model:[myOrder: order]
    }

    def myCurrentOrder() {
        User user = springSecurityService.getCurrentUser()

        if(user == null){
            user = User.findByUsername("admin")
        }

        MyOrder order = user.getCurrentOrder()

        if(order == null) {
            order = new MyOrder(dateCreated: new Date(), lastUpdated: new Date(), currentOrder: true, grandTotal: 0, user: user, items: [])
            order.save(flush:true, failOnError:true)
            user.orders << order
            user.save(flush:true, failOnError:true)
        }

        render view:'show', model:[myOrder: order]
    }

    def submitOrder() {
        MyOrder order = MyOrder.get(params.id)

        order.user.firstName = params.firstName
        order.user.lastName = params.lastName
        order.user.addressLine1 = params.addressLine1
        order.user.addressLine2 = params.addressLine2
        order.user.city = params.city
        order.user.state = params.state
        order.user.zipcode = params.zipcode
        order.user.creditCard = params.creditCard
        order.user.expiryDate = params.expiryDate ? Date.parse("yyyy-MM-dd", params.expiryDate) : null
        order.user.save(flush:true)
        if (order.validate()) {
            order.datePurchased = new Date()
            order.currentOrder = false
            order.save(flush: true, failOnError: true)
            render view: 'confirmation'
        }
        else {
            render view:'show', model:[myOrder: order]
        }
    }
}
