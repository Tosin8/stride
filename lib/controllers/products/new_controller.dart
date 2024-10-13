import 'package:get/get.dart';
import 'package:stride/model/products/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Initialize the Firestore instance
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  
  class NewProductController extends GetxController {
    static NewProductController instance =  Get.find();
    RxList<ProductModel> newProducts = RxList<ProductModel>([]);
    String collection = 'new';


    @override  
    void onReady() {
  
    super.onReady();
    newProducts.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() => 
  firebaseFirestore
  .collection(collection)
  .snapshots()
  .map((query) =>
   query
   .docs
   .map((item) => ProductModel.fromMap(item.data()))
   .toList()); 
  } 
