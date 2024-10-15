import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stride/controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Shopping Cart', 
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,

      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: cartController.cartItems.isEmpty
                  ? const Center(child: Text('Your cart is empty'))
                  : ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        var product = cartController.cartItems[index];

                        var imageUrl = product['image'] ?? '';
                        var productName = product['name'] ?? 'Unknown Product';
                        double price = product['price'] ?? 0.0;
                        int quantity = product['quantity'] ?? 1; // Get quantity

                        return ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          title: Text(productName),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${price.toStringAsFixed(2)} (Qty: $quantity)'),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      cartController.decreaseQuantity(product);
                                    },
                                  ),
                                  Text('$quantity'), // Display current quantity
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      cartController.increaseQuantity(product);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              cartController.removeProductFromCart(product);
                              // Show snackbar that the product has been removed
                              Get.snackbar(
                                'Product Removed',
                                '$productName has been removed from your cart.',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
            // Pay button when cart is empty or not
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (cartController.totalPrice > 0) {
                        // Navigate to checkout or payment
                        Get.toNamed('/checkout');
                      } else {
                        // Show message when cart is empty
                        Get.snackbar(
                          'Cart is Empty',
                          'Add products to your cart',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    child: Text(
                      cartController.totalPrice > 0
                          ? 'Pay \$${cartController.totalPrice.toStringAsFixed(2)}'
                          : 'Pay \$0.00', // Button when cart is empty
                    ),
                  ),
              
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
