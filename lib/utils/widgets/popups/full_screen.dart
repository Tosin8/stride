import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation_loader.dart';


class BFullScreenLoader{
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,  // Use Get.overlaycontext for overlay dialogs
      
      barrierDismissible: false, // the dialog can't be dismissed by tapping outside of it. 
      builder: (_) => PopScope(
        canPop: false,
        child: SizedBox(
          
          width: double.infinity,
           height: double.infinity, 
          child: Column(
            children: [
              const SizedBox(height: 250,), 
              BAnimationLoaderWidget(text: text, animation: animation), 
            ],
          ),
        )
        )
        ); 
  }


// Stopping the currently open loading dialog. 
/// this method returns nothing
/// 
 static stopLoading(){
  Navigator.of(Get.overlayContext!).pop(); // close the dialog using the navigator
}
}