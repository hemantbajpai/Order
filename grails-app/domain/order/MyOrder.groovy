package order

class MyOrder {

    int grandTotal
    Date dateCreated
    Date lastUpdated
    Date datePurchased

    static belongsTo = [user: User]
    static hasMany = [items: Item]

    static constraints = {
        grandTotal min: 0
        datePurchased nullable: true
    }
}
