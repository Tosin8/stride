// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:stride/controllers/controllers.dart';

// import 'product_card.dart';

// class NewProducts extends StatelessWidget {
//   const NewProducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: .63,
//         padding: const EdgeInsets.all(20),
//         mainAxisSpacing: 4.0,
//         crossAxisSpacing: 10.0,
//         shrinkWrap: true, // Add this to ensure GridView takes up only necessary space
//         physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
//         children: newProductController.newProducts
//             .map((item) => SingleProductWidget(product: item))
//             .toList(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/products/new_controller.dart';
  // Import your controller


class ProductsGrid extends StatelessWidget {
   ProductsGrid({super.key});
 final ProductController productController = Get.put(ProductController());  // Initialize the controller
  @override
  Widget build(BuildContext context) {
    return  Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // 2 columns in the grid
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            var product = productController.products[index] as Map<String, dynamic>;

            return Card(
              child: Column(
                children: [
                  // Placeholder for product image
                  Expanded(
                    child: Image.network(
                      product['image'] ?? '',  // Assuming 'image' is the field for the product image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Product name
                  Text(
                    product['name'] ?? 'No Name',  // Assuming 'name' is the field for the product name
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // Product price
                  Text(
                    '\$${product['price'] ?? '0'}',  // Assuming 'price' is the field for the product price
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            );
          },
        );
      });
  }
}