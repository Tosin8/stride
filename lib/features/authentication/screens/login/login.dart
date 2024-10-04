import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stride/common/widgets/form/form_divider.dart';
import 'package:stride/common/widgets/form/social_btns.dart';
import 'package:stride/utils/common/styles/spacing_styles.dart';
import 'package:stride/utils/constants/text_strings.dart';
import 'package:stride/utils/helpers/helpers_function.dart';


import '../../../../utils/constants/sizes.dart';

import '../../controllers/login/login_controller.dart';
import 'login.widget/login_form.dart';
import 'login.widget/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    Get.put(LoginController()); // Initialize the controller

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BSpacingStyle.paddingWithAppBarHeight,
          child: Column(

            // logo, title and sub-title. 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BLoginHeader(dark: dark),
              const SizedBox(height: BSizes.spaceBtwInputFields),
              const BLoginForm(),
              BFormDivider(
                dark: dark,
                DividerText: (BTexts.orSignInWith.capitalize ?? 'Sign In With').toString(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: BSizes.spaceBtwSections),
              const BFormSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
