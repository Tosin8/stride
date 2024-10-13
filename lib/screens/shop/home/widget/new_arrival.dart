import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stride/controllers/products/new_controller.dart';

class NewArrivalScreen extends StatefulWidget {
  const NewArrivalScreen({super.key});

  @override
  State<NewArrivalScreen> createState() => _NewArrivalScreenState();
}

class _NewArrivalScreenState extends State<NewArrivalScreen> {
   final ProductController productController = Get.put(ProductController()); // Assuming ProductController is the class name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // add back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
    
        title: const Text('New Arrival'),
      ),
body:  Obx(() {
      if (productController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      // Ensure the GridView is inside a container with a bounded height
      return SizedBox(
        height: double.infinity,  // Define a specific height or use MediaQuery to make it dynamic
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),  // Disable scrolling inside the grid
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
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
    }));
    
  }
}