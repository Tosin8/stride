import 'package:flutter/material.dart';
import 'package:stride/model/productSlider.dart';

import '../product_details/carousel.dart';

class productCarouselCard extends StatelessWidget {
  const productCarouselCard({
    super.key, required this.productSliders,
  });
final ProductSlider productSliders; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CarouselDetails(productSliders: productSliders,))
      ); 
     },
     child: AnimatedContainer(
      duration: const Duration(
       milliseconds: 300 
       ),
       decoration:  BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), 
            blurRadius: 20, 

            offset: const Offset(0, 5), 
          )
        ]), 
        child: 
      SingleChildScrollView(
        child: Hero(
          tag: productSliders.image,
          child: Column(
          
               children: [
                 Container(
                   height: 200,
                   width: 400,
                   clipBehavior: Clip.hardEdge,
                 
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), 
                   ),
                   child: Image.asset(productSliders.image, 
                   fit: BoxFit.cover,), 
                    
                 ),
                // const SizedBox(height: 10,), 
                 Text(productSliders.title, 
                 style: const TextStyle(
                  fontSize: 20,
                   fontWeight: FontWeight.bold),), 
                  // const SizedBox(height: 3),
                   Text(productSliders.category,
                    style: TextStyle(
                      fontSize: 16,
                     color: Colors.black.withOpacity(0.7)),
                     ),  
          //const SizedBox(height: 3),
                   Text(productSliders.price.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 40, width: 40,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10), 
                              ),
                              color: Colors.black,
                            ),
                            child: const Icon(Icons.add, color: Colors.white,
                            size: 20,),
                          ), 
                          const SizedBox(width: 5,), 
                      
                        ],
                      ) 
               ],
             ),
        ),
      ),
       ),
     );
    
  }
}