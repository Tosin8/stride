
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stride/utils/colors.dart';
import 'package:stride/utils/constants/sizes.dart';
import 'package:stride/utils/constants/text_strings.dart';
import 'package:stride/utils/helpers/helpers_function.dart';

import '../../../controllers/signup/signup_controller.dart';

class BTermsAndConditionCheckbox extends StatelessWidget {
  const BTermsAndConditionCheckbox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = BHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
           height: 24, 
          child: Obx(
            ()
            => Checkbox(
              value: 
            controller.privacyPolicy.value, 
            onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
          ),
        ), 
        const SizedBox(width: BSizes.spaceBtwItems,), 
      Text.rich(
        TextSpan(
          children: 
          [
            TextSpan(text: '${BTexts.iAgreeTo} ', 
            style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: BTexts.privacyPolicy, 
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? BColors.white : BColors.primary, 
            decoration: TextDecoration.underline)),  
            TextSpan(text: ' ${BTexts.and} ', 
            style: Theme.of(context).textTheme.bodySmall)
            , 
             TextSpan(text: BTexts.termsOfUse, 
             style: Theme.of(context).textTheme.bodyMedium!.apply(color: dark ? BColors.white : BColors.primary, 
            decoration: TextDecoration.underline
            )), 
            
          ]
        )
        ), 
      ],
    );
  }
}
