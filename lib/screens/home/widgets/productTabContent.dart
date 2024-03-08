
import 'package:flutter/material.dart';
import 'package:stride/screens/home/tabViewPages/popular/popularpage.dart';

class productTabContents extends StatelessWidget {
  const productTabContents({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return 
    Container(
       width: double.maxFinite,
       height: MediaQuery.of(context).size.height,
      child: 
        TabBarView(
         controller: _tabController,
         children: const [
          
             popularPage(),
           
          
          
             Text('Popular'),
           
             Text('Adidas'),
           
           
            
            Text('Nike'),
         
             Text('Puma'),
           
         ]));
     
  }
}
