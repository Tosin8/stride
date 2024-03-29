import 'package:flutter/material.dart';
import 'package:stride/model/newarrivalproducts.dart';

class NewArrivalProductCard extends StatelessWidget {
  const NewArrivalProductCard({super.key, 
  required this.newArrivalProducts});

final newArrivalProduct newArrivalProducts; 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, width: 280, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), 
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: 
          //       Colors.black.withOpacity(0.2), 
          //       spreadRadius: 0.4, 
          //       offset: const Offset(1, 1)
              
          //   )
          // ]
        ),
         
        
         child: Row(
          children: [
            CircleAvatar(
              radius: 40, 
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(newArrivalProducts.image),
            ), 
            SizedBox(width: 10,), 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newArrivalProducts.title,
                 style: const TextStyle(
                  fontSize: 15, 
                  fontWeight: FontWeight.w500, 
                  ),), 
                Text(newArrivalProducts.category), 
                Text(newArrivalProducts.price.toString(), 
                style: const TextStyle(
                  fontSize: 18,
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

