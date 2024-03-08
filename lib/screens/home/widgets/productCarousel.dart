import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class productCarousel extends StatelessWidget {
  const productCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            image: const DecorationImage(image: AssetImage('assets/banner/banner_2.jpg'), 
            fit: BoxFit.contain),
          ),
          ),
                 ] ),
    );
  }
}