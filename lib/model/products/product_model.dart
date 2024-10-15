class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const BRAND = "brand";
  static const PRICE = "price";
  static const DESCRIPTION = "description";

  late String id;
  late String image;
  late String name;
  late String brand;
  late double price;  // Ensure this is a double
  late String description; 

  ProductModel({required this.id, required this.image, required this.name, required this.brand, required this.price, required this.description});

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    brand = data[BRAND] ?? '';
    price = double.tryParse(data[PRICE].toString()) ?? 0.0;  // Ensure this is parsed as a double
    description = data[DESCRIPTION];
  }
}
