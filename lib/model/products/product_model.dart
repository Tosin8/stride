class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const BRAND = "brand";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const IS_FAVORITE = "isFavorite";  // New field

  late String id;
  late String image;
  late String name;
  late String brand;
  late double price;
  late String description;
  bool isFavorite;  // Field to track if the product is favorited

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    this.isFavorite = false,  // Default to false
  });

  ProductModel.fromMap(Map<String, dynamic> data)
      : id = data[ID],
        image = data[IMAGE],
        name = data[NAME],
        brand = data[BRAND] ?? '',
        price = double.tryParse(data[PRICE].toString()) ?? 0.0,
        description = data[DESCRIPTION],
        isFavorite = data[IS_FAVORITE] ?? false;  // Handle the new field
}
