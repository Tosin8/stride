// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:stride/screens/shop/home/profile/usertile/address/add_new_address.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children:  const [
            AddressCard(landmark: 'Before Next Junction', beneficary: 'Home', street: '32 Collins Street', city: 'Lagos', area: 'Victoria Island',), 
            SizedBox(height: 10,), 
            Divider(), 
            AddressCard(landmark: 'Before CMS', beneficary: 'Office', street: '12 Bemica Street', city: 'Lagos', area: 'Lekki Phase 1',), 
            SizedBox(height: 10,),
            Divider(), 
            AddressCard(city: 'Abuja', landmark: 'before Mr Biggs', beneficary: 'GrandMa', street: '405 Mark Street', area: 'Jabi',), 
            SizedBox(height: 10,),
            Divider(), 
            AddressCard(landmark: 'Total Filling Station', beneficary: 'Sister', street: '34 Yewande Street', city: 'Ibadan', area: 'Along Bodija ',),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector( 
          onTap: (){
            Get.to(() => const AddNewAddress()); 
          }, 
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

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.landmark, required this.beneficary, required this.street, required this.city, required this.area,
  });

final String beneficary, street, city, area, landmark; 
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text(beneficary, 
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
          ), 
          Text('$street , ', 
          style: const TextStyle(fontSize: 15),), 
           Row(
            children: [
              Text('$landmark , ', style: const TextStyle(fontSize: 15),),
               Text(area, style: const TextStyle(fontSize: 15),), 
            ],
          ),
          Text('$city .'), 
       
      
        ]),
           IconButton(onPressed: (){}, icon: const Icon(Iconsax.trash, color: Colors.red,)), 
         
      ],
    );
  }
}
