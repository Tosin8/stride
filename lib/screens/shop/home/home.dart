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
      appBar: AppBar(
      leading: const Icon(Iconsax.menu),  
        flexibleSpace: const Padding(
          padding: EdgeInsets.only(top: 62),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.location),
              SizedBox(width: 5),
              Text('Lagos, Nigeria', style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      actions: [
        GestureDetector( 
          onTap: () {},
          child: Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children:[
             const Icon(Iconsax.notification), 
             Positioned(
               top: -8, right: -3,
               child: Container(
                width: 18, height: 18,
                decoration: const BoxDecoration(
                  
                  shape: BoxShape.circle, 
                  color: Colors.black
                ),
                child: const Center(child: Text('2', style: TextStyle(color: Colors.white),)),),
             )
          ], ),
        ),
        const SizedBox(width: 7,),
        const Stack(children:[
          Icon(Iconsax.shopping_cart)
        ] ), 

        const SizedBox(width: 15,), 
      ],
        ),
    );
  }
}