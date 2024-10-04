
import 'package:flutter/material.dart';

import 'package:stride/utils/constants/sizes.dart';
import 'package:stride/utils/device/device_utlity.dart';

import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
     top: BDeviceUtils.getAppBarHeight(), 
     right: BSizes.defaultSpace, 
     child: TextButton(
      onPressed: (){
        OnBoardingController.instance.skipPage(); 
      }, 
    child: const Text('Skip')));
  }
}
