import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;


  // Getter to get the total count of items in the cart
  var itemCount = 0.obs; // observable integer

  // Function to add item to cart
  void addItem() {
    itemCount++;
  }

  // Function to remove item from cart
  void removeItem() {
    if (itemCount > 0) {
      itemCount--;
    }
  }

  // Function to get item count
  int getItemCount() {
    return itemCount.value; // Ensure this returns an int
  }
  // Function to add a product to the cart
  void addProductToCart(Map<String, dynamic> product) {
    // Check if the product is already in the cart
    if (cartItems.any((item) => item['id'] == product['id'])) {
      // Show a snackbar message
      Get.snackbar(
        'Product Already in Cart',
        '${product['name']} is already added.',
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

    // Show snackbar message that the product has been added
    Get.snackbar(
      'Product Added',
      '${product['name']} has been added to your cart.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }


  // Function to increase the quantity of a product
  void increaseQuantity(Map<String, dynamic> product) {
    var index = cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1) {
      cartItems[index]['quantity']++;
      cartItems.refresh(); // Refresh the cartItems observable
    }
  }

  // Function to decrease the quantity of a product
  void decreaseQuantity(Map<String, dynamic> product) {
    var index = cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      cartItems.refresh(); // Refresh the cartItems observable
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
