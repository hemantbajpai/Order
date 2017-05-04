package order

class Item {

    String name
    int currentPrice
    int price
    String size
    int quantity
    boolean showItem

    static belongsTo = [order: MyOrder]

    static constraints = {
        currentPrice min: 0
        price min: 0
        quantity min:1
        size inList: ["small", "medium", "large"]
    }
}
