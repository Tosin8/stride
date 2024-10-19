
import 'package:flutter/material.dart';

import '../utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, 
  
  required this.image, 
  required this.title,
   required this.subTitle,
    required this.onTap, 
    });


final String image, title, subTitle; 
final VoidCallback onTap; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15), 
          child: Column(
            children: [
              // Lottie.asset(image,
              //  width: MediaQuery.of(context).size.width * 0.6), 
            
               Image(image: AssetImage(image), width: BHelperFunctions.screenWidth() * 0.6,), 
              const SizedBox(
                height: 18,),

              /// title and subtitle
              Text(title, 
              style: Theme.of(context).textTheme.headlineMedium,
               textAlign: TextAlign.center,), 
               const SizedBox(
                height: 18,), 
               
                  Text(subTitle, 
              style: Theme.of(context).textTheme.labelMedium,
               textAlign: TextAlign.center,),
               const SizedBox(
                height: 18,), 

               /// Button 
               SizedBox(
                width: double.infinity, 
                child: GestureDetector(
                  onTap: onTap,
                   child: Container(
                    height: 50, 
                    width: double.infinity, 
                    decoration: BoxDecoration(color: Colors.black, 
                    borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: const Text('Continue')),),
               )

            ],
          ),),

      )
    );
  }
}