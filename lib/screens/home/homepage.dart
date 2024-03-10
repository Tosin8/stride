// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/productCarousel.dart';
import 'widgets/productTab.dart';
import 'widgets/productTabContent.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final double maxSlide = 225.0; 
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
 late  AnimationController animationController; 

  int _current = 0; 
  dynamic _selectdProduct = {}; 

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,
     duration: const Duration(milliseconds: 250), 
    ); 
  }

  void toggle() => animationController.isDismissed ? animationController.forward() : animationController.reverse(); 

  
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 5, vsync: this);
    return Stack(
      
      children:[
        const navBar(), 
        
        Transform(
          transform: Matrix4.identity()
          ..translate(maxSlide)
          ..scale(0.7),
          alignment: Alignment.centerLeft,
          child: main_body(tabController: _tabController))
     ] ); 
    
  }
}

class main_body extends StatelessWidget {
  const main_body({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
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


class navBar extends StatelessWidget {
  const navBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}

