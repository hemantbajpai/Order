package order

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	String firstName
	String lastName
	String addressLine1
	String addressLine2
	String city
	String state
	String zipcode
	String creditCard
	Date expiryDate

	static hasMany = [orders: MyOrder]

	MyOrder getCurrentOrder() {
		MyOrder order
		orders.each {
			if(it.currentOrder)
				order =  it
		}
		order
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true
		creditCard(creditCard: true)
		firstName blank: false
		lastName blank: false
		addressLine1 blank: false
		addressLine2 blank: false
		city blank: false
		state blank: false
		zipcode blank: false
		expiryDate min: new Date()
	}

	static mapping = {
		password column: '`password`'
	}
}
