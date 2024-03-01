import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class productCarousel extends StatelessWidget {
  const productCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      
      child: CarouselSlider(
        options: CarouselOptions( 
          
          pauseAutoPlayOnTouch: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          aspectRatio: 16/9,
          enlargeCenterPage: true,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.easeInOut,  
          
        ),
        
        items: [
      
        Container(
          height: 250, 
          width:MediaQuery.of(context).size.width ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(image: AssetImage('assets/banner/banner_adj.jpg'), 
            fit: BoxFit.contain),
          ),
          ),
          
        Container(
          height: 250, 
          width:MediaQuery.of(context).size.width ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(image: AssetImage('assets/banner/banner_2.jpg'), 
            fit: BoxFit.contain),
          ),
          ),
                 ] ),
    );
  }
}

class productTab extends StatelessWidget {
  const productTab({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      
    //  height: MediaQuery.of(context).size.height, 
      child:  TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          controller: _tabController,
          labelColor: Colors.black,
          labelPadding: const EdgeInsets.only(left: 20, right: 20),
          unselectedLabelColor: Colors.grey, 
          indicator: CircleTabIndicator(
            color:Colors.black,
             radius: 4),
          tabs: const [
             Tab(
              child: Text('Popular',
              ),
            ), 
              Tab(
              child: Text('Adidas',
              ),
            ),
              Tab(
              child: Text('Jordan',
               ),
            ),
             Tab(
              child: Text('Nike',
              ),
            ),
             Tab(
              child: Text('Puma',
            ),
            ),
        
        ]),
      );
  }
}


class productTabContents extends StatelessWidget {
  const productTabContents({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.maxFinite,
       height: MediaQuery.of(context).size.height,
       child:  TabBarView(
         controller: _tabController,
         children: const [
          
             popularPage(),
           
          
          
             Text('Popular'),
           
             Text('Adidas'),
           
           
            
            Text('Nike'),
         
             Text('Puma'),
           
         ]),
     );
  }
}
