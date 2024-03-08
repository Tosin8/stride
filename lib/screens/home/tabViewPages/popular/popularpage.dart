// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';
import 'package:stride/model/deals_product.dart';


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
        title: 'New Arrival Products',
      ), 
       const SizedBox(height: 10,), 
       Container(
        height: 120,
        
          
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
        title: '30% Deals Products',
      ), 
      const SizedBox(height: 20,), 
      Container(
      height: 1500,
        child: Expanded(child: 
        GridView.builder(
           physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 100.0,
                ),
        
          itemCount: DealsProducts.length,
          itemBuilder: (_, index){
            return dealProductsCard(
              DealsProducts: DealsProducts[index],
            );
          }
        )),
      ), 
      
       

       
    ]));
  }
}



class dealProductsCard extends StatelessWidget {
  const dealProductsCard({
    Key? key, required this.DealsProducts,
    
  }) : super(key: key);

final DealsProduct DealsProducts; 
  @override
  Widget build(BuildContext context, ) {
    return Container(
    height: 1500, 
      child: ListView(
        shrinkWrap: true,
        children: [
        Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Container(
              height: 150, 
              decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), 
              topRight: Radius.circular(10)
              ),
                image: DecorationImage(
                  image: AssetImage(
                    DealsProducts.image
                  ),
                  fit: BoxFit.cover, 
                  
                ),
                
              )
            ),
            
            Text(DealsProducts.title, 
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
             const SizedBox(height: 5,), 
             Text(DealsProducts.category, 
             style: const TextStyle(color: Colors.grey),),
             const SizedBox(height: 2,), 
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text(DealsProducts.price,
              style: const TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.w700, fontSize: 18),),
             GestureDetector(
             onTap:() {
               
             },
               child: Container(
               height: 30, 
               width: 30,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(80),
                 color: Colors.black
               ),
               child: const Center(
               child: Icon(Icons.add, color: Colors.white
               
               
               )
               ),
               ),
             )
             ],)
        
          ]
        ),
    ]  )
    );
  }
}
