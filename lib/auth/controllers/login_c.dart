import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
 final email =  TextEditingController();
 final password = TextEditingController(); 
  
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  //final userController = Get.put(UserController());
 

@override 
  void onInit() {
    
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ;
  
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ;
    super.onInit(); 
  }

  // Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      BFullScreenLoader.openLoadingDialog('Logging you in...', BImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        BFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        BFullScreenLoader.stopLoading();
        return;
      }

    // save data if remember me is selected
    if (rememberMe.value) {
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
    }
    }
  }
}