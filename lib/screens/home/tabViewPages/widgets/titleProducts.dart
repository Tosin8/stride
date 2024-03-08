import 'package:flutter/material.dart';

class titleProducts extends StatelessWidget {
   titleProducts({ required this.title, 
    super.key,
  });

String title; 
  @override
  Widget build(BuildContext context) {
    return Text(title, 
     style: const TextStyle(
      color: Colors.black, 
      fontWeight: FontWeight.bold,
      fontSize: 18),);
  }
}
