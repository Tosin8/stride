import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';

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
          padding: const EdgeInsets.all(8.0),
          child: ListView( 
            children:  [
             
              const Text('Collection', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),), 
             
              Container(
                width: MediaQuery.of(context).size.width,
                
                child: CarouselSlider(
                  options: CarouselOptions( 
                    
                    pauseAutoPlayOnTouch: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                    aspectRatio: 16/9,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayCurve: Curves.easeInOut,  
                    
                  ),
                  
                  items: [
                
                  Container(
                    height: 250, 
                    width:MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(image: AssetImage('assets/banner/banner_adj.jpg'), 
                      fit: BoxFit.contain),
                    ),
                    ),
                    
                  Container(
                    height: 250, 
                    width:MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(image: AssetImage('assets/banner/banner_adj.jpg'), 
                      fit: BoxFit.contain),
                    ),
                    ),
                           ] ),
              )
            ],
          ),
        ),
      ); 
    
  }
}