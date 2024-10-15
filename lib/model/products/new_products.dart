import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stride/controllers/cart_controller.dart';
import 'package:stride/controllers/products/new_controller.dart';
import 'package:stride/controllers/products/wishlist_controller.dart';

class ProductsGrid extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());  // Initialize CartController
final WishlistController wishlistController = Get.put(WishlistController());
  ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return _buildShimmerLoading();
      }

      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,   // Define a specific height or use MediaQuery to make it dynamic
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .75, 
            crossAxisSpacing: 15,
            mainAxisSpacing: 5.0,
          ),
         // itemCount: productController.products.length,  // Display all products
         itemCount: 4,
          itemBuilder: (context, index) {
            var product = productController.products[index] as Map<String, dynamic>;

           return Stack(
             children:[
             
              // product layout
               Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 GestureDetector(
                   onTap: () {},
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(10),
                     child: CachedNetworkImage(
                       imageUrl: product['image'] ?? '',
                       fit: BoxFit.cover,
                       height: 150,  // Set a fixed height for uniformity
                width: double.infinity,
                       placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.grey[200],
              ),
                       ),
                       errorWidget: (context, url, error) => const Icon(Icons.error),
                     ),
                   ),
                 ),
                 const SizedBox(height: 10),
                 Text(
                   product['name'] ?? 'No Name',
                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     // Ensure price is handled as a number
                     Text(
                       '\$${(product['price'] is String ? double.tryParse(product['price']) : product['price']) ?? 0}',
                       style: const TextStyle(color: Colors.green, fontSize: 16),
                     ),
                     //const SizedBox(width: 30),
                     IconButton(
                       icon: const Icon(Icons.add_shopping_cart),
                       onPressed: () {
              cartController.addProductToCart(product);
                       },
                     ),
                   ],
                 ),
               ],
             ),

                // Love icon for wishlist
            Positioned(
              right: 0,
              child: IconButton(
                icon: wishlistController.isFavorite(product['id'])
                    ? const Icon(Iconsax.heart, color: Colors.red) // Filled red heart
                    : const Icon(Iconsax.heart5, color: Colors.red), // Outlined heart
                onPressed: () {
                  wishlistController.toggleFavoriteStatus(product);
                },
              ),
            ), 
         ]  );

          },
        ),
      );
    });
  }

  
  Widget _buildShimmerLoading() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4,  // Number of shimmer items to show
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 120, // Adjust height for the image placeholder
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 10,
                  width: 70, // Width of the shimmer effect
                  color: Colors.grey[200],
                ),
                const SizedBox(height: 5),
                Container(
                  height: 10,
                  width: 50, // Width of the shimmer effect
                  color: Colors.grey[200],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



