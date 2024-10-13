
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stride/auth/forms/verify.dart';
import 'package:stride/auth/repository/auth_repo.dart';
import 'package:stride/model/user_model.dart';
import 'package:stride/utils/widgets/popups/loaders.dart';

import '../../../../utils/http/network_manager.dart';

import '../../utils/widgets/constants/images_c.dart';
import '../../utils/widgets/popups/full_screen.dart';
import '../repository/user_repo.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find(); 
  final isLoading = false.obs; // Add this variable to track loading state


  /// variables
  final hidePassword = true.obs; // observable for hiding/showing password. 
  final privacyPolicy = true.obs; 
  final email = TextEditingController(); 
  final lastName = TextEditingController(); 
  final username = TextEditingController(); 
  final password = TextEditingController(); 
  final firstName = TextEditingController(); 
  final phoneNumber = TextEditingController(); 
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //form key for form validation 
  
  ///  -- signup
   
  void signup() async {
    try{

      // Start loading
      BFullScreenLoader.openLoadingDialog('We are processing your information...', SImages.docerAnimation); 

// Check Internet Connection
final isConnected = await NetworkManager.instance.isConnected(); 
if(!isConnected) 
{
  BFullScreenLoader.stopLoading();
return; 
}

// form validation
if(!signupFormKey.currentState!.validate()) 
{BFullScreenLoader.stopLoading(); 
return; 
}
// privacy policy
if(!privacyPolicy.value) {
  BLoaders.warningSnackBar( 
    title: 'Accept Privay Policy', 
    message: 'In order to create your account, you must accept the privacy policy and terms of use.', 
    );
    
  return ; 
}

// Register user in the firebase auth. and save user data in the firebase. 
final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
  email.text.trim(),
   password.text.trim()); 

// Save auth. user data in the firebase firestore 
final newUser = UserModel(
  id: userCredential.user!.uid, 
  firstName: firstName.text.trim(), 
  lastName: lastName.text.trim(), 
  username: username.text.trim(), 
  email: email.text.trim(), 
  phoneNumber : phoneNumber.text.trim(), 
  profilePicture: '', 
); 

final userRepository = Get.put(UserRepository()); 
await userRepository.saveUserRecord(newUser); 

// Remove Loader
BFullScreenLoader.stopLoading(); 

// Show success message
BLoaders.successSnackBar(
  title: 'Congratulations', 
  message: 'You have successfully created your account. Verify email to continue',
); 

// move to verify email screen 

Get.to(() =>  VerifyMail(email: email.text.trim())); 
    } catch (e) {

      // remove loader
       BFullScreenLoader.stopLoading();

      // show some generic error to the user
      BLoaders.errorSnackBar(
        title: 'Oh Snap!', 
        message: e.toString()); 
    }
}}