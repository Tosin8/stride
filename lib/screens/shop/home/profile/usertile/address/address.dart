import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      body: ListView(
        children: const [
          
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector( 
          onTap: (){}, 
          child: Container(
            decoration: BoxDecoration(
                 color: Colors.black,
              borderRadius: BorderRadius.circular(11)
            ),
            height: 60,
               
            child: const Align(
              child: Text('Add New Address', 
              style: TextStyle(color: Colors.white, 
              fontSize: 16),),
            ),
          ),
        ),
      ),
    );
  }
}