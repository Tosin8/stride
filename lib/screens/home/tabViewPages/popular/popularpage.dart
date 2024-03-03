

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stride/model/newarrivalproducts.dart';
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
       ListView.builder(
        itemCount: newArrivalProducts.length,
        itemBuilder: (_, index){
          return NewArrivalProductCard(
            newArrivalProducts: newArrivalProducts[index],);
        })
       

       
    ]));
  }
}



class NewArrivalProductCard extends StatelessWidget {
  const NewArrivalProductCard({super.key, 
  required this.newArrivalProducts});

final newArrivalProduct newArrivalProducts; 
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), 
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: 
                Colors.black.withOpacity(0.2), 
                spreadRadius: 0.4, 
                offset: const Offset(1, 1)
              
            )
          ]
        ),
         width: 280, 
         height: 100,
         child: Row(
          children: [
            CircleAvatar(
              radius: 60, 
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(newArrivalProducts.image),
            ), 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newArrivalProducts.title,
                 style: const TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w500, 
                  ),), 
                Text(newArrivalProducts.category), 
                Text(newArrivalProducts.price.toString(), 
                style: const TextStyle(fontSize: 18,
                 fontWeight: FontWeight.bold),)
              ],
            ), 
            const SizedBox(width: 49,), 
            Container(
              height: 40,width: 30,
             
              decoration: const BoxDecoration(
                 color: Colors.black,
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(15), 
  bottomLeft: Radius.circular(15), 
)
              ),
              child: const Icon(Icons.add, color: Colors.white,),
            )
          ],
         ),
       );
       
  }
}

