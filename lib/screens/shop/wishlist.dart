import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stride/controllers/cart_controller.dart';
import 'package:stride/controllers/products/wishlist_controller.dart';


class Wishlist extends StatelessWidget {
  final WishlistController wishlistController = Get.find();
  final CartController cartController = Get.find();

   Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: Obx(() {
        if (wishlistController.wishlistItems.isEmpty) {
          return const Center(
            child: Text('Your wishlist is empty.'),
          );
        }

        return ListView.builder(
          itemCount: wishlistController.wishlistItems.length,
          itemBuilder: (context, index) {
            var product = wishlistController.wishlistItems[index];
            return ListTile(
              leading: Image.network(product['image']),
              title: Text(product['name']),
              subtitle: Text('\$${product['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  cartController.addProductToCart(product);
                  wishlistController.removeProductFromWishlist(product);
                },
                child: const Text('Add to Cart'),
              ),
            );
          },
        );
      }),
    );
  }
}
