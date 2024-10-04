
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:stride/common/widgets/form/form_divider.dart';
import 'package:stride/common/widgets/form/social_btns.dart';
import 'package:stride/utils/constants/sizes.dart';
import 'package:stride/utils/constants/text_strings.dart';
import 'package:stride/utils/helpers/helpers_function.dart';

import 'signup.widget/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            BSizes.defaultSpace), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// title 
              Text(BTexts.signupTitle, 
              style: Theme.of(context).textTheme.headlineSmall,), 
              const SizedBox(height: BSizes.spaceBtwSections,), 

              /// Form
              signUpForm(dark: dark), 
const SizedBox(height: BSizes.spaceBtwSections,), 
              /// Divider
              BFormDivider(dark: dark, DividerText: BTexts.orSignUpWith.capitalize!),
              const SizedBox(height: BSizes.spaceBtwSections,),

              //Social Media Btn  
              const BFormSocialMedia(), 
              const SizedBox(height: BSizes.spaceBtwSections,),
        
            ],
          )),
      ),

    );
  }
}

