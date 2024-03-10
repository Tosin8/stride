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

final double maxSlide = 225.0; 
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  

  int _current = 0; 
  dynamic _selectdProduct = {}; 



  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 5, vsync: this);
    return   Stack(
          
          children:[
           
            
            main_body(tabController: _tabController), 
             const navBar(), 
            
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

    
    return
   
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
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


