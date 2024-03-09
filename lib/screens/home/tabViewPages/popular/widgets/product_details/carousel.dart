import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stride/model/productSlider.dart';

class CarouselDetails extends StatelessWidget {
  const CarouselDetails({super.key, required this.productSliders});

final ProductSlider productSliders; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        fit: StackFit.expand, 
        children: [
          Hero(
            tag: productSliders.image,
            child: Transform.rotate(
              angle: 0.7,
              child: Image.asset(productSliders.image, fit: BoxFit.cover))),
     AppBar(
      backgroundColor: Colors.transparent,
        leading: GestureDetector(
         onTap: () {
          Navigator.pop(context);
         }, 
          child: const Icon(Icons.arrow_back_ios, color: Colors.white,)), 
          actions: [
            const Icon(Icons.favorite_border_outlined, color: Colors.white,), const SizedBox(width: 20,), 
          ],
      ), 
      DraggableScrollableSheet(
        builder: (context, controller) => Container
        (
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), 
              topRight: Radius.circular(10)
            ), 
             color: Colors.white70, 
          ),
         
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              controller: controller, 
              //itemCount: productSliders.length,
              children: [
                 Row(
                    children: [
                      Text(productSliders.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                      ),
                      const Spacer(),
                      Text(productSliders.price.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),)
                    ],
                  ),
                Text(productSliders.category, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),),
                const SizedBox(height: 20,), 
                Text(productSliders.description, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                ),
                const SizedBox(height: 20,), 
                const Text('Color', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),), 
                const SizedBox(height: 10,),
                productColor(), 
                const SizedBox(height: 10,),
                 const Text('Size', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),), 
                        const SizedBox(height: 10,),
                        const Row(
                          children: [
                            shoeSizes(
                              title: '32'
                            ), 
                            SizedBox(width: 15,), 
                              shoeSizes(
                              title: '38'
                            ), 
                             SizedBox(width: 15,), 
                              shoeSizes(
                              title: '41'
                            ), SizedBox(width: 15,),  
                              shoeSizes(
                              title: '43'
                            ), 
                          ],), 
                           SizedBox(height: 15,), 
                           Container(
                            width: double.infinity, 
                            height: 50, 
                            decoration: BoxDecoration(
                              color: Colors.black, 
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Align(child: Text('Add to cart', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,)),
                           )
              ],
              ),
          ),
        ))
        ],
      )
    );
  }
}

class productColor extends StatelessWidget {
  const productColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Container(
          height: 30,
          width: 30, 
    decoration: BoxDecoration(
      color: Colors.blue, 
      borderRadius: BorderRadius.circular(30), 
    ),
    
        ), 
        const SizedBox(width: 20,), 
         Container(
          height: 30,
          width: 30, 
    decoration: BoxDecoration(
      color: Colors.green, 
      borderRadius: BorderRadius.circular(30), 
    ),
    
        ), const SizedBox(width: 20,),  Container(
          height: 30,
          width: 30, 
    decoration: BoxDecoration(
      color: Colors.yellow, 
      borderRadius: BorderRadius.circular(30), 
    ),
    
        )
      ]
    );
  }
}

class shoeSizes extends StatelessWidget {
  const shoeSizes({
    super.key, this.title,
  });
final title; 
  @override
  Widget build(BuildContext context) {
    return Text(title, style: 
    const TextStyle(fontSize: 18),);
  }
}

