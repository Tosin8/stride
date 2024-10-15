

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController extends GetxController {
  // RxList to hold the fetched product data
  var products = [].obs;
  var isLoading = true.obs;

  // Firestore collection reference
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('new');

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  // Fetch products from Firestore
  void fetchProducts() async {
    try {
      isLoading(true);
      QuerySnapshot querySnapshot = await productsRef.get();
      products.value = querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e');
    } finally {
      isLoading(false);
    }
  }
}
