
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// //import '../utils/helpers/helper_function.dart';
// import 'shop/home/home.dart';
// import 'shop/profile.dart';
// import 'shop/store.dart';
// import 'shop/wishlist.dart';


// class NavigationMenu extends StatelessWidget {
//   const NavigationMenu({super.key});

//   @override 
//   Widget build(BuildContext  context) {

//     final controller = Get.put(NavigationController()); 
//    // final darkMode = BHelperFunctions.isDarkMode(context);
//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () =>
//          NavigationBar(
//           elevation: 0,
//           height: 75,
//         selectedIndex: controller.selectedIndex.value,
//         onDestinationSelected: ( index) =>
//           controller.selectedIndex.value = index,  
//           backgroundColor: Colors.black, 
//           indicatorColor: Colors.white, 
//           labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        
//           destinations: const [
//             NavigationDestination(
//               icon: Icon(Iconsax.home), 
//               label: 'Home'),
//          NavigationDestination(
//           icon: Icon(Iconsax.shop),
//            label: 'Menu',),
//             NavigationDestination(
//               icon: Icon(Iconsax.heart),
//                label: 'Wishlist'),
           
//             NavigationDestination(
//               icon: Icon(Iconsax.user), 
//               label: 'Profile'),
            
            
//           ],),
//       ),

//         body: Obx(() =>  controller.screens[controller.selectedIndex.value]), 
//     ); 
//   }
// }

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;

//   final screens = [
//     const HomeScreen(),  
//    const Store(), 
//     const Wishlist(), 
//     const UserProfile(),  
//   ]; 
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'shop/home/home.dart';
import 'shop/home/profile/profile.dart';
import 'shop/store/store.dart';
import 'shop/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          height: 75,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          indicatorColor: Colors.black,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: controller.selectedIndex.value == 0 ? Colors.white : Colors.grey),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop, color: controller.selectedIndex.value == 1 ? Colors.white : Colors.grey),
              label: 'Menu',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart, color: controller.selectedIndex.value == 2 ? Colors.white : Colors.grey),
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user, color: controller.selectedIndex.value == 3 ? Colors.white : Colors.grey),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const Store(),
     Wishlist(),
    UserProfile(),
  ];
}
