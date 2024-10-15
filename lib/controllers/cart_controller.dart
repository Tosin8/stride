import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  // Function to add a product to the cart
  void addProductToCart(Map<String, dynamic> product) {
    // Check if the product is already in the cart
    if (cartItems.any((item) => item['id'] == product['id'])) {
      // Show a snackbar message
      Get.snackbar(
        'Product Already Added',
        'The product is already added, check your cart.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return; // Exit the function if the product is already in the cart
    }

     // Parse price as double, if necessary
  double price = double.tryParse(product['price'].toString()) ?? 0.0;

    // Otherwise, add the product to the cart
    cartItems.add({
      ...product,
      'price': price,  // Ensure price is stored as double
      'quantity': 1, // Initialize quantity to 1
    });
  }

  // Function to increase the quantity of a product
  void increaseQuantity(Map<String, dynamic> product) {
    var index = cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1) {
      cartItems[index]['quantity']++;
    }
  }

  // Function to decrease the quantity of a product
  void decreaseQuantity(Map<String, dynamic> product) {
    var index = cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    }
  }

  // Calculate total price
  double get totalPrice {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  // Function to remove a product from the cart
  void removeProductFromCart(Map<String, dynamic> product) {
    cartItems.removeWhere((item) => item['id'] == product['id']);
  }
}
