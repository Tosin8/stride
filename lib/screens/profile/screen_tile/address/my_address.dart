import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:stride/screens/profile/screen_tile/address/add_new_address.dart';
import 'package:stride/screens/profile/screen_tile/address/widget/single_address.dart';
import 'package:stride/utils/constants/sizes.dart';
import 'package:stride/utils/helpers/helpers_function.dart';

import '../../../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: BColors.primary,
        child: Icon(Iconsax.add,
         color: dark ?  BColors.black: BColors.white),
        onPressed: () => Get.to(() => const AddNewAddressScreen())),
        appBar: AppBar(
          //showBackArrow: true, 
          title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,)
        ),
      body:  const SingleChildScrollView(
        child: Padding(padding: 
        EdgeInsets.all(BSizes.defaultSpace), 
        child: Column(
          children: [
SingleAddress(selectedAddress: true), 
SingleAddress(selectedAddress: false), 
          ],
        )
        ),
      ), 
    );
  }
}