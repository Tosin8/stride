import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: Image.asset('assets/icons/menu_32.png'),
        actions: [
          // IconButton(
          //   onPressed: (){}, 
          //   icon: Icon(Icons.notifications))
          Container(
            width:25, height: 25,
            child: Image.asset('assets/icons/bell.png')), 
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ListView(
          children:  [
           
            const Text('Collection', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),), 
            const SizedBox(height: 3,), 
            Container(
              height: 250, 
              width:MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(image: AssetImage('assets/banner/banner_1.jpg'), 
                fit: BoxFit.cover),
              ),
              )
          ],
        ),
      )
    );
  }
}