
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stride/data/repositories/authentication/authentication_repository.dart';
import 'package:stride/features/personalization/models/user_model.dart';
import 'package:stride/utils/constants/image_strings.dart';
import 'package:stride/utils/loaders/loaders.dart';

import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/http/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find(); 

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
      BFullScreenLoader.openLoadingDialog('We are processing your information...', BImages.docerAnimation); 

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

Get.to(() =>  VerifyEmailScreen(email: email.text.trim())); 
    } catch (e) {

      // remove loader
       BFullScreenLoader.stopLoading();

      // show some generic error to the user
      BLoaders.errorSnackBar(
        title: 'Oh Snap!', 
        message: e.toString()); 
    }
}}