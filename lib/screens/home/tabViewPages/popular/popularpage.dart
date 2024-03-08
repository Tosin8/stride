// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'lib\model\30%deals.dart';
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
         const SizedBox(height: 10,), 
          titleProducts(
        title: '30% Deals',
      ), 
      Flexible(child: 
      GridView.builder(
         physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),

        itemCount: dealsProducts.length,
        itemBuilder: (_, index){
          return dealProductsCard(
            dealsProducts: dealsProducts[index],
          );
        }
      )), 
      
       

       
    ]));
  }
}



class dealProductsCard extends StatelessWidget {
  const dealProductsCard({
    Key? key,
    required this.dealsProducts,
  }) : super(key: key);

final dealsProduct dealsProducts; 
  @override
  Widget build(BuildContext context, ) {
    return Card(
      child: Column( 
        children: [
          Container(
            height: 150, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  dealsProducts.image
                )
                
              ),
              
            )
          )
        ]
      )
    );
  }
}
