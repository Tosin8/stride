import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login/login.dart';



class SplashScreen
 extends StatelessWidget {
  const SplashScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      FadeIn(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOutQuad,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash.jpg'),
          fit: BoxFit.cover), 
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),  
          
                  Colors.transparent, 
                ], 
                begin: Alignment.bottomCenter), 
            ),
            child: 
             Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
        FadeIn(
          delay: const Duration(milliseconds: 1000),
          duration: const Duration(milliseconds: 1000),
          child: const Text('Stride',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 40, 
            fontFamily: 'Maturascript'),),
        ), 
          const SizedBox(height: 10,), 
          const Divider(
            height: 3, thickness: 2,indent: 100, endIndent: 100,
            color: Colors.white,  
          ), 
          const SizedBox(height: 20,), 
                FadeInUp(
                  curve: Curves.easeInBack,
                  delay: const Duration(milliseconds: 1500), 
                  duration: const Duration(milliseconds: 1000),
                  child: const Text('Thousands of Shoe Styles\nfrom Top Brands', style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,),
                ),
                const SizedBox(height: 40,), 
                const SplashButton(), 
                const SizedBox(height: 60,), 
        
        
        
        
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SplashButton extends StatelessWidget {
  const SplashButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp( 
      curve: Curves.easeInBack,
      delay: const Duration(milliseconds: 2000),
      duration: const Duration(milliseconds: 1000),
      child: GestureDetector( 
        onTap:() {
          Get.to(() => const LoginScreen());
        
        },
        child: Container(
          height: 50, width: 200,
          decoration: BoxDecoration(
            color: Colors.black, 
            borderRadius: BorderRadius.circular(10), 
          ),
        child: const Align(
          child: Text('Start Shopping',
           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
           fontSize: 20),),
        ),
        ),
      ),
    );
  }
}