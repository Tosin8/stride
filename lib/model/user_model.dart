import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stride/model/cart_item.dart';
import 'package:stride/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  List<CartItemModel> cart;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.cart,
  });

  String get fullName => "$firstName $lastName";

  String get formattedPhoneNo => BFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generatedUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    return "cwt_${firstName}${lastName}";
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
        cart: [],
      );

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Cart': cartItemsToJson(),  // Include cart serialization.
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        cart: _convertCartItems(data['cart'] ?? []),  // Process cart items.
      );
    } else {
      return UserModel.empty();
    }
  }

  static List<CartItemModel> _convertCartItems(List<dynamic> cartFromDb) {
    List<CartItemModel> result = [];
    for (var element in cartFromDb) {
      result.add(CartItemModel.fromMap(element));
    }
    return result;
  }

  List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}
