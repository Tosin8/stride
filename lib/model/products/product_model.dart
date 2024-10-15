class ProductModel{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const BRAND = "brand";
  static const PRICE = "price";
  static const DESCRIPTION = "description";

late   String id;
 late  String image;
late String name;
late String brand;
  late double price;
  late String description; 

  // ProductModel({required this.id, required this.image, required this.name, required this.brand,required this.price, required this.description});

  // ProductModel.fromMap(Map<String, dynamic> data){
  //   id = data[ID];
  //   image = data[IMAGE];
  //   name = data[NAME];
  //   brand = data[BRAND] ?? '';
  //   price = data[PRICE].toDouble();
  //   description = data[DESCRIPTION];
  // }

ProductModel.fromMap(Map<String, dynamic> data) {
  id = data[ID];
  image = data[IMAGE];
  name = data[NAME];
  brand = data[BRAND] ?? '';
  
  // Ensure price is correctly converted to a double, regardless of its type
  if (data[PRICE] is String) {
    price = double.tryParse(data[PRICE]) ?? 0.0;  // Safely parse string to double
  } else if (data[PRICE] is int) {
    price = (data[PRICE] as int).toDouble();  // Convert int to double
  } else if (data[PRICE] is double) {
    price = data[PRICE];  // It's already a double
  } else {
    price = 0.0;  // Default to 0.0 if the type is unexpected
  }

  description = data[DESCRIPTION];
}

}