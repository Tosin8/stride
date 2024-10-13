import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // AppBar. 
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
           backgroundColor: Colors.grey.shade100,
        leading: const Icon(Iconsax.menu),
        flexibleSpace: const Padding(
          padding: EdgeInsets.only(top: 62),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.location),
              SizedBox(width: 5),
              Text(
                'Lagos, Nigeria',
                style: TextStyle(color: Colors.black),
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
                    )),
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
                const Icon(Iconsax.shopping_cart),
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
                    child: const Align(
                        child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ]),
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
        )
      ),
    );
  }
}
