
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qwibix/features/authentication/controllers/signup/signup_controller.dart';
import 'package:qwibix/utils/constants/sizes.dart';
import 'package:qwibix/utils/constants/text_strings.dart';
import 'package:qwibix/utils/validators/validation.dart';

import 'terms_condition_checkbox.dart';

class signUpForm extends StatelessWidget {
  const signUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
      children: [
    Row(
      
      children: [
        Expanded(
          child: TextFormField(
            controller: controller.firstName, 
             validator: (value) => BValidator.validateEmptyText('First Name', value), 
            textInputAction: TextInputAction.next, 
            keyboardType: TextInputType.name,
            
            expands: false,
            decoration: const InputDecoration(
              labelText: BTexts.firstName, prefixIcon: Icon(Iconsax.user), 
            ),
          ),
        ), 
        const SizedBox(width: BSizes.spaceBtwInputFields,), 
          Expanded(
          child: TextFormField(
            controller: controller.lastName, 
             validator: (value) => BValidator.validateEmptyText('Last Name', value),
             textInputAction: TextInputAction.next, 
            keyboardType: TextInputType.name,
            expands: false,
            decoration: const InputDecoration(
              labelText: BTexts.lastName, prefixIcon: Icon(Iconsax.user), 
            ),
          ),
        )
      ],
    ), 
    const SizedBox(height: BSizes.spaceBtwInputFields,), 
    
    ///UserName
    TextFormField(
       controller: controller.username, 
        validator: (value) => BValidator.validateEmptyText('User Name', value),
             textInputAction: TextInputAction.next, 
            keyboardType: TextInputType.name,
          
            decoration: const InputDecoration(
              labelText: BTexts.username, prefixIcon: Icon(Iconsax.user), 
            ),
          ),
          const SizedBox(height: BSizes.spaceBtwInputFields,), 
    
    ///Email
    TextFormField(
       controller: controller.email, 
        validator: (value) => BValidator.validateEmail(value),
             textInputAction: TextInputAction.next, 
            keyboardType: TextInputType.emailAddress,
          
            decoration: const InputDecoration(
              labelText: BTexts.email, prefixIcon: Icon(Iconsax.direct), 
            ),
          ),
          const SizedBox(height: BSizes.spaceBtwInputFields,), 
    
    ///PhoneNumber
    TextFormField(
       controller: controller.phoneNumber, 
        validator: (value) => BValidator.validatePhoneNumber(value),
             textInputAction: TextInputAction.next, 
            keyboardType: TextInputType.phone,
          
            decoration: const InputDecoration(
              labelText: BTexts.phoneNo, prefixIcon: Icon(Iconsax.call), 
            ),
          ),
          const SizedBox(height: BSizes.spaceBtwInputFields,), 
    
    ///Password
    Obx(
      () =>  TextFormField(
         controller: controller.password, 
          validator: (value) => BValidator.validatePassword( value),
               textInputAction: TextInputAction.next, 
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.hidePassword.value,
            
              decoration:  InputDecoration(
                labelText: BTexts.password,
                 prefixIcon: const Icon(Iconsax.password_check), suffixIcon: 
                 IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                 icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye) , 
              ),
            ),
      ),
    ), 
          const SizedBox(height: BSizes.spaceBtwSections,), 
    
          /// Terms and Conditions CheckBox 
          BTermsAndConditionCheckbox(dark: dark), 
    const SizedBox(height: BSizes.spaceBtwSections,), 

          /// Sign Up Button 
          SizedBox(width: double.infinity, 
          child: ElevatedButton(
          //   onPressed: (){
          //   Get.to(()=> const VerifyEmailScreen());
          // },
          onPressed: () => controller.signup(),
           child: const Text(BTexts.createAccount)),)
      ],
    ));
  }
}













