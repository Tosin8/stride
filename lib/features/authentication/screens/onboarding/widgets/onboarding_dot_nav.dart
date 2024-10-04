
import 'package:flutter/material.dart';
;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stride/utils/colors.dart';
import 'package:stride/utils/constants/sizes.dart';
import 'package:stride/utils/helpers/helpers_function.dart';

import '../../../../../utils/device/device_utlity.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
final controller = OnBoardingController.instance; 
    final dark = BHelperFunctions.isDarkMode(context);
    return Positioned(
     bottom: BDeviceUtils.getBottomNavigationBarHeight() + 25,
     left: BSizes.defaultSpace,
     child: SmoothPageIndicator(
       effect:  ExpandingDotsEffect(
         activeDotColor: dark? BColors.light : BColors.dark, 
         dotHeight: 6
       ),
       controller: controller.pageController, 
       onDotClicked: controller.dotNavigationClick, 
       
        count: 3));
  }
}
