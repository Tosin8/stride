// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

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
    return   Stack(
          
          children:[
           
             const navBar(), 
            main_body(tabController: _tabController), 
            
            
         ] );
        }
      
    
    
  }


class main_body extends StatefulWidget {
  const main_body({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  State<main_body> createState() => _main_bodyState();
}

class _main_bodyState extends State<main_body> {
  @override
  Widget build(BuildContext context) {
late double xOffset = 0;
  late double yOffset = 0;
    late double scaleFactor = 1;

    @override 

void initState() {
  super.initState();
  //closeDrawer(); 
}

// void openDrawer() => setState((){
// xOffset = 230; 
// yOffset = 110;
// scaleFactor = 0.8; 
// });

// void closeDrawer() => setState((){
//   xOffset = 0; 
//   yOffset = 0;
//   scaleFactor = 1; 
// });
    

    
void tapDrawer() => setState((){
  xOffset = xOffset == 0 ? 230 : 0; 
  yOffset = yOffset == 0 ? 110 : 0; 
  scaleFactor = scaleFactor == 1 ? 0.8 : 1;
}); 

bool _tapDrawer = false; 
    return
   
      Container(
        transform: Matrix4.translationValues(
          xOffset,
           yOffset, 0)
        ..scale(scaleFactor),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: tapDrawer, 
              child: 
             
              const Icon(Iconsax.menu),
            ), 
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
                   
                  productTab(tabController: widget._tabController),
                  
                   productTabContents(tabController: widget._tabController),
                  
                ],
              ),
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
        color: Colors.black, 
        child: Padding(
          padding: const EdgeInsets.only(
            
            top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Stride',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 35, 
            fontFamily: 'Maturascript')),  
SizedBox(height: 20,), 
          GestureDetector(
            onTap: (){},
            child: const ListTile(
              leading: Icon(Iconsax.home, color: Colors.white), 
              title: Text('Home', style: TextStyle(color: Colors.white),),
            ),
          ), 
           GestureDetector(
            onTap: (){},
            child: const ListTile(
              leading: Icon(Iconsax.shopping_cart, color: Colors.white), 
              title: Text('Cart', style: TextStyle(color: Colors.white),),
            ),
          ), 
           GestureDetector(
            onTap: (){},
            child: const ListTile(
              leading: Icon(Iconsax.folder_favorite, color: Colors.white), 
              title: Text('Favorite', style: TextStyle(color: Colors.white),),
            ),
          ), 
           GestureDetector(
            onTap: (){},
            child: const ListTile(
              leading: Icon(Iconsax.user, color: Colors.white), 
              title: Text('Profile', style: TextStyle(color: Colors.white),),
            ),
          ), 
            GestureDetector(
            onTap: (){},
            child: const ListTile(
              leading: Icon(Iconsax.notification, color: Colors.white), 
              title: Text('Notification', style: TextStyle(color: Colors.white),),
            ),
          ), 
          SizedBox(height: 20,), 
          Divider(
            color: Colors.white,
            thickness: 1,
            indent: 0,
            endIndent: 200,
            ),
             GestureDetector(
            onTap: (){},
            child: const ListTile(
              leading: Icon(Iconsax.setting, color: Colors.white), 
              title: Text('App Settings', style: TextStyle(color: Colors.white),),
            ),
          ), 
           GestureDetector(
            onTap: (){},
            child: const ListTile(
              leading: Icon(Iconsax.call, color: Colors.white), 
              title: Text('Customer Care', style: TextStyle(color: Colors.white),),
            ),
          ), 
          
        
             GestureDetector(
            onTap: (){},
            child: const ListTile(
              leading: Icon(Iconsax.close_circle, color: Colors.white), 
              title: Text('Close App', style: TextStyle(color: Colors.white),),
            ),
          ), 
          ],),
        )
        
      ),
    );
  }
}


