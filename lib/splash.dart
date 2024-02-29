import 'package:flutter/material.dart';

class SplashScreen
 extends StatelessWidget {
  const SplashScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
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
const Text('Stride',
style: TextStyle(
  color: Colors.white, 
  fontSize: 30, 
  fontFamily: 'Maturascript'),), 
        const SizedBox(height: 10,), 
        const Divider(
          height: 3, thickness: 2,indent: 100, endIndent: 100,
          color: Colors.white,  
        ), 
        const SizedBox(height: 20,), 
              const Text('Thousand of Shoe Styles\nfrom Top Brands', style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,),
              const SizedBox(height: 40,), 
              GestureDetector( 
                onTap:() {
                  
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
              const SizedBox(height: 60,), 




              
            ],
          ),
        ),
      ),
    );
  }
}