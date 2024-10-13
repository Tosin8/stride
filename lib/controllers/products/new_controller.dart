// import 'package:get/get.dart';
// import 'package:stride/model/products/product_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// // Initialize the Firestore instance
// final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  
//   class NewProductController extends GetxController {
//     static NewProductController instance =  Get.find();
//     RxList<ProductModel> newProducts = RxList<ProductModel>([]);
//     String collection = 'new';


//     @override  
//     void onReady() {
  
//     super.onReady();
//     newProducts.bindStream(getAllProducts());
//   }

//   Stream<List<ProductModel>> getAllProducts() => 
//   firebaseFirestore
//   .collection(collection)
//   .snapshots()
//   .map((query) =>
//    query
//    .docs
//    .map((item) => ProductModel.fromMap(item.data()))
//    .toList()); 
//   } 

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
