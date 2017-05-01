package order

class MyOrder {
    
    int grandTotal
    Date dateCreated
    Date lastUpdated
    Date datePurchased
    boolean currentOrder

    static belongsTo = [user: User]
    static hasMany = [items: Item]

    int getTotal() {
        int total = 0
        items.each {
            if(it.showItem) {
                total += it.currentPrice
            }
        }
        return total
    }

    static constraints = {
        grandTotal min: 0
        datePurchased nullable: true
    }
}
