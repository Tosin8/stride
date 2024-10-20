import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stride/model/products/new_products.dart';
import 'package:stride/utils/common/texts/header_title.dart';

import 'widgets/brand_icons.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        bottom: const PreferredSize(preferredSize: Size.fromHeight(30), child: Searchbtn(),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
      
              
              HeaderTitle(
                text: 'Brands',
                onPressed: () {},
              ),
              const SizedBox(height: 10,), 
              // Brand images
              const BrandIcons(),
              const SizedBox(height: 30,), 
              ProductsGrid(), 
            ],
          ),
        ),
      ),
    );
  }
}

class Searchbtn extends StatelessWidget {
  const Searchbtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
    Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Icon(Iconsax.search_normal),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value) {
                  // Handle search action here
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search your sneakers",
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    const SizedBox(width: 10),
    Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Iconsax.sort,
        color: Colors.white,
      ),
    ),
                  ],
                ),
              );
  }
}
