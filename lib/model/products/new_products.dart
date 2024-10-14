import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:stride/controllers/products/new_controller.dart';

class ProductsGrid extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        // Shimmer effect while loading
        return _buildShimmerLoading();
      }

      // Debugging: Print the number of products retrieved
      print('Number of products retrieved: ${productController.products.length}');

      return SizedBox(
        height: 400,  // Define a specific height or use MediaQuery to make it dynamic
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),  // Disable scrolling inside the grid
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
              childAspectRatio: .63,
            crossAxisSpacing: 10,
           
        mainAxisSpacing: 4.0,
           // mainAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            var product = productController.products[index] as Map<String, dynamic>;

            return Column(
             // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Placeholder for product image
                GestureDetector(
                  onTap: () {},
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: product['image'] ?? '',
                        fit: BoxFit.cover,
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
                ),
                const SizedBox(height: 10),
                // Product name
                Text(
                  product['name'] ?? 'No Name',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                // Product price
                Row(
                  children: [
                    Text(
                      '\$${product['price'] ?? '0'}',
                      style: const TextStyle(color: Colors.green, 
                      fontSize: 16),
                    ),
                    const SizedBox(width: 30), 
                     IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cartController.addProductToCart(product);
                  })
                  ],
                ),
              ],
            );
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
