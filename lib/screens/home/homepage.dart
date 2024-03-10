// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'widgets/productCarousel.dart';
import 'widgets/productTab.dart';
import 'widgets/productTabContent.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  int _current = 0; 
  dynamic _selectdProduct = {}; 

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 5, vsync: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: Image.asset('assets/icons/menu_32.png'),
        actions: [
          // IconButton(
          //   onPressed: (){}, 
          //   icon: Icon(Icons.notifications))
          // ignore: sized_box_for_whitespace
          Container(
            width:20, height: 20,
            child: Image.asset('assets/icons/bell.png')), 
          const SizedBox(width: 10),
        ],
      ),
      body: 
        Padding(
          padding:  const EdgeInsets.all(8.0),
          child: ListView( 
            children:  [
             
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Collection',
                 style: TextStyle(
                  fontSize: 25, 
                  fontWeight: FontWeight.w500),),
              ), 
             
              const productCarousel(), 
               
              productTab(tabController: _tabController),
              
               productTabContents(tabController: _tabController),
              
            ],
          ),
        ),
      ); 
    
  }
}


