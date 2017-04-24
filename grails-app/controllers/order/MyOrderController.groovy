package order

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured([Role.ROLE_ADMIN])
class MyOrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured([Role.ROLE_ADMIN, Role.ROLE_USER, Role.ROLE_ANONYMOUS])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MyOrder.list(params), model:[myOrderCount: MyOrder.count()]
    }

    @Secured([Role.ROLE_ADMIN, Role.ROLE_USER, Role.ROLE_ANONYMOUS])
    def signup() {
        render view:'signup'
    }

    @Secured([Role.ROLE_ADMIN, Role.ROLE_USER, Role.ROLE_ANONYMOUS])
    def createAccount() {
        User user = new User(username: params.username, password: params.password, firstName: params.firstName, lastName: params.lastName, addressLine1: params.addressLine1, addressLine2: params.addressLine2, city: params.city, state: params.state, zipcode: params.zipcode, creditCard: params.creditCard, expiryDate: Date.parse("yyyy-MM-dd", params.expiryDate))
        user.save(flush: true, failOnError:true)

        Role userRole = Role.findByAuthority(Role.ROLE_USER)
        UserRole.create(user, userRole).save(flush:true, failOnError:true)

    }

    @Secured([Role.ROLE_ADMIN, Role.ROLE_USER, Role.ROLE_ANONYMOUS])
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

    @Secured([Role.ROLE_ADMIN, Role.ROLE_USER, Role.ROLE_ANONYMOUS])
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

    @Secured([Role.ROLE_ADMIN, Role.ROLE_USER, Role.ROLE_ANONYMOUS])
    def submitOrder() {
        MyOrder order = MyOrder.get(params.id)
        order.datePurchased = new Date()
        order.currentOrder = false
        order.save(flush:true, failOnError:true)
        render view:'confirmation'
    }

    def show(MyOrder myOrder) {
        respond myOrder
    }

    def create() {
        respond new MyOrder(params)
    }

    @Transactional
    def save(MyOrder myOrder) {
        if (myOrder == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (myOrder.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond myOrder.errors, view:'create'
            return
        }

        myOrder.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'myOrder.label', default: 'MyOrder'), myOrder.id])
                redirect myOrder
            }
            '*' { respond myOrder, [status: CREATED] }
        }
    }

    def edit(MyOrder myOrder) {
        respond myOrder
    }

    @Transactional
    def update(MyOrder myOrder) {
        if (myOrder == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (myOrder.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond myOrder.errors, view:'edit'
            return
        }

        myOrder.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'myOrder.label', default: 'MyOrder'), myOrder.id])
                redirect myOrder
            }
            '*'{ respond myOrder, [status: OK] }
        }
    }

    @Transactional
    def delete(MyOrder myOrder) {

        if (myOrder == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        myOrder.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'myOrder.label', default: 'MyOrder'), myOrder.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'myOrder.label', default: 'MyOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
