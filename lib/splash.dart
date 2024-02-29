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
            children: [

              Text('Thousand of Shoe Styles\nfrom Top Brands')
            ],
          ),
        ),
      ),
    );
  }
}