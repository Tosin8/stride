
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:stride/features/personalization/controllers/user_controller.dart';
import 'package:stride/utils/constants/sizes.dart';
import 'package:stride/utils/constants/text_strings.dart';
import 'package:stride/utils/validators/validations.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance; 
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace), 
          child: Form(
            key: controller.reAuthFormKey, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
// Email
TextFormField(
  textInputAction: TextInputAction.next,
  controller: controller.verifyEmail, 
  validator: BValidator.validateEmail, 
  decoration: const InputDecoration(
    prefixIcon: Icon(Iconsax.direct_right), 
  labelText: BTexts.email),
), 
const SizedBox(height: BSizes.spaceBtwInputFields,), 

// Password
Obx( 
  () =>
   TextFormField(
    obscureText: controller.hidePassword.value,
    textInputAction: TextInputAction.done,
    controller: controller.verifyPassword, 
    validator: BValidator.validatePassword, 
    decoration:  InputDecoration(
      suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
       icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
      prefixIcon: const Icon(Iconsax.password_check), 
    labelText: BTexts.password),
    
  ),
), 
const SizedBox(height: BSizes.spaceBtwSections,), 

// login btn 
SizedBox(
  width: double.infinity, 
  child: ElevatedButton(
    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
     child: const Text('Verify')),)
              ],
            ), 
            ),
            ),
      )
    );
  }
}