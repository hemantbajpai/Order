package order

class Item {

    String name
    int price
    String size
    int quantity

    static belongsTo = [order: MyOrder]

    static constraints = {
        quantity min:1
        size inList: ["small", "medium", "large"]
    }
}
