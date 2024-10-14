class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";

  final String id;
  final String image;
  final String name;
  final int quantity;
  final double cost;
  final String productId;
  final double price;

  CartItemModel({
    required this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.cost,
    required this.productId,
    required this.price,
  });

  CartItemModel.fromMap(Map<String, dynamic> data)
      : id = data[ID] ?? '',
        image = data[IMAGE] ?? '',
        name = data[NAME] ?? '',
        quantity = (data[QUANTITY] ?? 0) as int,
        cost = (data[COST] ?? 0.0).toDouble(),
        productId = data[PRODUCT_ID] ?? '',
        price = (data[PRICE] ?? 0.0).toDouble();

  Map<String, dynamic> toJson() => {
        ID: id,
        PRODUCT_ID: productId,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price * quantity, // Calculating total cost here
        PRICE: price,
      };
}
