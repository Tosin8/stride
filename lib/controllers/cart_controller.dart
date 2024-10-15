// import 'package:get/get.dart';
// import 'package:stride/model/products/product_model.dart';

// class CartController extends GetxController {
//   var cartItems = <Map<String, dynamic>>[].obs;


//   // Getter to get the total count of items in the cart
//   var itemCount = 0.obs; // observable integer

//   // Function to add item to cart
//   void addItemToCart(ProductModel product) {
//     // Add product to cart
//     itemCount.value++; // Increment the item count
//   }

//   // Function to remove item from cart
//  void removeItemFromCart(ProductModel product) {
//     // Remove product from cart
//     if (itemCount.value > 0) {
//       itemCount.value--; // Decrement the item count
//     }
//   }

//   // Function to get item count
//   int getItemCount() {
//     return itemCount.value; // Ensure this returns an int
//   }
//   // Function to add a product to the cart
//   void addProductToCart(Map<String, dynamic> product) {
//     // Check if the product is already in the cart
//     if (cartItems.any((item) => item['id'] == product['id'])) {
//       // Show a snackbar message
//       Get.snackbar(
//         'Product Already in Cart',
//         '${product['name']} is already added.',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return; // Exit the function if the product is already in the cart
//     }

//     // Parse price as double, if necessary
//     double price = double.tryParse(product['price'].toString()) ?? 0.0;

//     // Otherwise, add the product to the cart
//     cartItems.add({
//       ...product,
//       'price': price,  // Ensure price is stored as double
//       'quantity': 1, // Initialize quantity to 1
//     });

//     // Show snackbar message that the product has been added
//     Get.snackbar(
//       'Product Added',
//       '${product['name']} has been added to your cart.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }


//   // Function to increase the quantity of a product
//   void increaseQuantity(Map<String, dynamic> product) {
//     var index = cartItems.indexWhere((item) => item['id'] == product['id']);
//     if (index != -1) {
//       cartItems[index]['quantity']++;
//       cartItems.refresh(); // Refresh the cartItems observable
//     }
//   }

//   // Function to decrease the quantity of a product
//   void decreaseQuantity(Map<String, dynamic> product) {
//     var index = cartItems.indexWhere((item) => item['id'] == product['id']);
//     if (index != -1 && cartItems[index]['quantity'] > 1) {
//       cartItems[index]['quantity']--;
//       cartItems.refresh(); // Refresh the cartItems observable
//     }
//   }

//   // Calculate total price
//   double get totalPrice {
//     double total = 0.0;
//     for (var item in cartItems) {
//       total += item['price'] * item['quantity'];
//     }
//     return total;
//   }

//   // Function to remove a product from the cart
//   void removeProductFromCart(Map<String, dynamic> product) {
//     cartItems.removeWhere((item) => item['id'] == product['id']);
//   }
// }


import 'package:get/get.dart';
import 'package:stride/model/products/product_model.dart';

class CartController extends GetxController {
  // Observable list of cart items
  var cartItems = <Map<String, dynamic>>[].obs;

  // Observable integer for total item count
  var itemCount = 0.obs;

  // Function to add item to cart using ProductModel
  void addItemToCart(ProductModel product) {
    itemCount.value++;  // Increment the item count
  }

  // Function to remove item from cart using ProductModel
  void removeItemFromCart(ProductModel product) {
    if (itemCount.value > 0) {
      itemCount.value--;  // Decrement the item count
    }
  }

  // Getter to return total item count
  int getItemCount() {
    return itemCount.value;
  }

  // Function to add a product to the cart (using Map format)
  void addProductToCart(Map<String, dynamic> product) {
    // Check if the product is already in the cart
    if (cartItems.any((item) => item['id'] == product['id'])) {
      // Show a snackbar message
      Get.snackbar(
        'Product Already in Cart',
        '${product['name']} is already added.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Parse price as double, if necessary
    double price = double.tryParse(product['price'].toString()) ?? 0.0;

    // Add the product to the cart with initial quantity of 1
    cartItems.add({
      ...product,
      'price': price,   // Ensure price is stored as a double
      'quantity': 1,    // Initialize quantity to 1
    });

    // Show a snackbar message that the product has been added
    Get.snackbar(
      'Product Added',
      '${product['name']} has been added to your cart.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Function to increase the quantity of a product in the cart
  void increaseQuantity(Map<String, dynamic> product) {
    var index = cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1) {
      cartItems[index]['quantity']++;  // Increment quantity
      cartItems.refresh();  // Refresh to update UI
    }
  }

  // Function to decrease the quantity of a product in the cart
  void decreaseQuantity(Map<String, dynamic> product) {
    var index = cartItems.indexWhere((item) => item['id'] == product['id']);
    if (index != -1 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;  // Decrease quantity if greater than 1
      cartItems.refresh();  // Refresh to update UI
    }
  }

  // Getter to calculate the total price of items in the cart
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
