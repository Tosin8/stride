import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stride/data/repositories/authentication/authentication_repository.dart';
import 'package:stride/screens/profile/widget.profileuser/profile_user_screen.dart';
import 'package:stride/utils/constants/sizes.dart';


import 'widget/userprofiletile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              
              // Header
         Column(
                children: [
                  //AppBar
                 
                  const SizedBox(height: BSizes.spaceBtwItems,), 

                  // Profile Card
                   UserProfileTile(onPressed: () => Get.to ( () => const ProfileUserScreen(),)), 
                  const SizedBox(height: BSizes.spaceBtwSections,), 
                ],
              ), 

              Padding(padding: const EdgeInsets.all(BSizes.defaultSpace), 
              child: Column(
                children: [

                  // Account Setting. 
                 

                    // logout button.
                    const SizedBox(height: BSizes.spaceBtwSections,), 
                    SizedBox(width: double.infinity,
                    child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Logout'),), 
                    ), 
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}