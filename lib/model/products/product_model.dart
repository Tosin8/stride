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


// import 'package:hive/hive.dart';

// // This will be generated

// @HiveType(typeId: 0)  // Assign a unique typeId
// class ProductModel extends HiveObject {
//   @HiveField(0)
//   late String id;

//   @HiveField(1)
//   late String image;

//   @HiveField(2)
//   late String name;

//   @HiveField(3)
//   late String brand;

//   @HiveField(4)
//   late double price;

//   @HiveField(5)
//   late String description;

//   @HiveField(6)
//   bool isFavorite;

//   ProductModel({
//     required this.id,
//     required this.image,
//     required this.name,
//     required this.brand,
//     required this.price,
//     required this.description,
//     this.isFavorite = false,
//   });

//   ProductModel.fromMap(Map<String, dynamic> data)
//       : id = data['id'],
//         image = data['image'],
//         name = data['name'],
//         brand = data['brand'] ?? '',
//         price = double.tryParse(data['price'].toString()) ?? 0.0,
//         description = data['description'],
//         isFavorite = data['isFavorite'] ?? false;
// }
