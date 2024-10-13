import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
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
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            var product = productController.products[index] as Map<String, dynamic>;

            return Card(
              child: Column(
                children: [
                  // Placeholder for product image
                  Expanded(
                    child: Image.network(
                      product['image'] ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Product name
                  Text(
                    product['name'] ?? 'No Name',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // Product price
                  Text(
                    '\$${product['price'] ?? '0'}',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
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
