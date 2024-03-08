

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:stride/common/widgets/titleProducts.dart';
import 'package:stride/model/newarrivalproducts.dart';
import 'package:stride/model/productSlider.dart';


import 'widgets/cards/new_arrival.dart';
import 'widgets/cards/productCarousel.dart';

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
      const SizedBox(height: 10,), 
      
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
       const SizedBox(height: 20,), 
      titleProducts(
        title: 'New Arrival',
      ), 
       const SizedBox(height: 10,), 
       Container(
        height: 130,
        
          
           child: Expanded(
             child: ListView.builder(
              
          
              scrollDirection: Axis.horizontal,
              itemCount: newArrivalProducts.length,
              itemBuilder: (_, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NewArrivalProductCard(
                    newArrivalProducts: newArrivalProducts[index],),
                  
                );
              }),
           ),
         ),
         SizedBox(height: 10,), 
          titleProducts(
        title: '30% Deals',
      ), 
      
       

       
    ]));
  }
}



