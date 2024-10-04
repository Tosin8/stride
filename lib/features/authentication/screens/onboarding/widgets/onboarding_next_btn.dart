
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:stride/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:stride/utils/colors.dart';
import 'package:stride/utils/constants/sizes.dart';
import 'package:stride/utils/device/device_utlity.dart';
import 'package:stride/utils/helpers/helpers_function.dart';

class OnBoardingNextBtn extends StatelessWidget {
  const OnBoardingNextBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = BHelperFunctions.isDarkMode(context); 
    return Positioned(
     right: BSizes.defaultSpace,
     bottom: BDeviceUtils.getBottomNavigationBarHeight() , 
     child: ElevatedButton(
       style: ElevatedButton.styleFrom(
         shape: const CircleBorder(), 
         backgroundColor: dark? BColors.primary : Colors.black),
       onPressed: (){
        OnBoardingController.instance.nextPage(); 
       },
        child: const Icon(Iconsax.arrow_right_3)));
  }
}



