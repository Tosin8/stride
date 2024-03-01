import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:stride/screens/home/hwidget.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: Image.asset('assets/icons/menu_32.png'),
        actions: [
          // IconButton(
          //   onPressed: (){}, 
          //   icon: Icon(Icons.notifications))
          Container(
            width:25, height: 25,
            child: Image.asset('assets/icons/bell.png')), 
          const SizedBox(width: 10),
        ],
      ),
      body: 
        Padding(
          padding:  const EdgeInsets.all(8.0),
          child: ListView( 
            children:  [
             
              const Text('Collection', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),), 
             
              const productCarousel(), 
              const SizedBox(height: 10,), 
              Container(
                child: const TabBar(
                  tabs: [
                    Tab(
                      child: Text('Popular',
                       style: TextStyle(color: Colors.black),),
                    ), 
                     Tab(
                      child: Text('Adidas',
                       style: TextStyle(color: Colors.black),),
                    ),
                     Tab(
                      child: Text('Jordan',
                       style: TextStyle(color: Colors.black),),
                    ),
                     Tab(
                      child: Text('Nike',
                       style: TextStyle(color: Colors.black),),
                    ),
                     Tab(
                      child: Text('Puma',
                       style: TextStyle(color: Colors.black),),
                    ),

                ]),
              ), 
              Container(
                child: const TabBarView(children: []),
              )
            ],
          ),
        ),
      ); 
    
  }
}

