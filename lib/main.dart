
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stride/auth/repository/user_repo.dart';
import 'package:stride/controllers/products/new_controller.dart';
import 'package:stride/controllers/products/wishlist_controller.dart';

import 'package:stride/firebase_options.dart';

import 'app.dart';
import 'auth/repository/auth_repo.dart';
import 'controllers/cart_controller.dart';




Future<void> main() async {
  /// widgets binding 
  
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized(); 

  /// getx local storage 
  await GetStorage.init();

  /// await splash until other items load

FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

/// iniitalize firebase and auth. repository
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  (FirebaseApp value) {
     Get.put(
    AuthenticationRepository()); 
    Get.put(ProductController()); 
     Get.put(CartController()); 
     Get.put(WishlistController()); 
     Get.put(UserRepository()); 
  }

  ); 

  // load all the material design
   runApp(const MyApp());  
}