

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stride/model/productSlider.dart';

import '../widgets.dart';
import 'productCarouselCard.dart';

class popularPage extends StatelessWidget {
  const popularPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SizedBox(height: 10,), 
      
      // Container(
      //   width: MediaQuery.of(context).size.width, 
      //   height: MediaQuery.of(context).size.height,
      //   child: 
      CarouselSlider(
          options: CarouselOptions(
            height: 300, 
          
           // aspectRatio: 16/9, 
            viewportFraction: 0.70, 
            enlargeCenterPage: true,  
          ),
          items: List.generate(
            productSliders.length,
           (index) => productCarouselCard(
             productSliders: productSliders[index],
           ) )
          ),
       SizedBox(height: 20,), 
      titleProducts(
        title: 'New Arrival',
      ), 
       const SizedBox(height: 10,), 
       

       
    ]));
  }
}





