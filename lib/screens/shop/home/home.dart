import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stride/model/products/new_products.dart';
import 'package:stride/screens/cart/cart.dart';
import 'package:stride/screens/shop/home/widget/promo_slider.dart';
import 'package:stride/utils/common/texts/header_title.dart';
import 'package:stride/controllers/cart_controller.dart'; // Adjust this path based on your project structure


import 'widget/new_arrival.dart';

class HomeScreen extends StatefulWidget {
  
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentLocation = 'Loading location...';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _currentLocation = 'Turn on your GPS for live location';
      });
      return;
    }

    // Check for location permissions.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _currentLocation = 'Location permissions are permanently denied';
        });
        return;
      }

      if (permission == LocationPermission.denied) {
        setState(() {
          _currentLocation = 'Location permissions are denied';
        });
        return;
      }
    }

    // If permissions are granted, get the user's current position using new location settings.
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];

      setState(() {
        _currentLocation = '${place.locality}, ${place.country}';
      });
    } catch (e) {
      setState(() {
        _currentLocation = 'Failed to get location: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leading: const Icon(Iconsax.menu),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 62),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Iconsax.location),
                const SizedBox(width: 5),
                Text(
                  _currentLocation,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                print('notification tapped');
              },
              child: Stack(
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  const Icon(Iconsax.notification),
                  Positioned(
                    top: -8,
                    right: -3,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: const Center(
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 7),
            Stack(
              fit: StackFit.passthrough,
              clipBehavior: Clip.none,
              children: [
                IconButton(onPressed: (){
                   showBarModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        color: Colors.white,
                        child: CartPage(),
                      ),
                    );
                }, icon: const Icon(Iconsax.shopping_cart)), 
              
                // Display dynamic item count
      //           Obx(() {
      //   final itemCount = Get.find<CartController>().itemCount.value;
      //   return Positioned(
      // top: -8,
      // right: -3,
      // child: Container(
      //   width: 18,
      //   height: 18,
      //   decoration: const BoxDecoration(
      //     shape: BoxShape.circle,
      //     color: Colors.black,
      //   ),
      //   child: Center(
      //     child: Text(
      //       '$itemCount',
           
      //       style: const TextStyle(color: Colors.white),
      //     ),
      //   ),
      // ),
      //   );
      // }),
              ],
            ),
            const SizedBox(width: 15),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(Iconsax.search_normal),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.search,
                              onFieldSubmitted: (value) {
                                // Handle search action here
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search your sneakers",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Iconsax.sort,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      
        // Body.
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PromoSlider(),
                const SizedBox(height: 10),
                HeaderTitle(
                  text: 'New Arrival',
                  onPressed: () {
                    Get.to(() => const NewArrivalScreen());
                  },
                ),
                ProductsGrid(),
                const SizedBox(height: 10),
                HeaderTitle(
                  text: 'Popular',
                  onPressed: () {
                    Get.to(() => const NewArrivalScreen());
                  },
                ),
                 ProductsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
