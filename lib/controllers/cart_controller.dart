import 'package:get/get.dart';

class CartController extends GetxController {
  // List of products in the cart
  var cartItems = [].obs;

  // Add a product to the cart
  void addProductToCart(Map<String, dynamic> product) {
    cartItems.add(product);
    Get.snackbar(
      "Product Added",
      "${product['name']} has been added to your cart!",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  // Remove a product from the cart
  void removeProductFromCart(Map<String, dynamic> product) {
    cartItems.remove(product);
  }

  // Get total price of the cart
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item['price'] ?? 0));
}
