import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stride/model/deals_product.dart';

class dealProductsCard extends StatelessWidget {
  const dealProductsCard({
    super.key, required this.DealsProducts,
    
  });

final DealsProduct DealsProducts; 
  @override
  Widget build(BuildContext context, ) {
    return  Container(
        
      height: 500, 
        child: 
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
              
              Expanded(
                child: Column(
                children :[ Text(DealsProducts.title, 
                style: const TextStyle(
                  fontSize: 18, 
                fontWeight: FontWeight.w700),),
              
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
          
            ]))]
          ),
       );
    
    
  }
}
