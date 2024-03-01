// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stride/model/productSlider.dart';

import 'package:stride/screens/home/hwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
          Container(
            width:25, height: 25,
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
                child: Text('Collection', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
              ), 
             
              const productCarousel(), 
               
              Container(
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
                ),
              
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height,
                  child:  TabBarView(
                    controller: _tabController,
                    children: [
                     Container(
                      width: MediaQuery.of(context).size.width, 
                      height: MediaQuery.of(context).size.height,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 400, 
                          aspectRatio: 16/9, 
                          viewportFraction: 0.70, 
                          enlargeCenterPage: true, 
                        ),
                        items: List.generate(
                          productSliders.length,
                         (index) => productCarouselCard(
                           productSlider: productSliders[index],
                         ) )
                        ),
                     ), 
                        Text('Popular'),
                      
                       Text('Adidas'),
                      
                      
                       
                       Text('Nike'),
                    
                       Text('Puma'),
                      
                    ]),
                ),
              )
            ],
          ),
        ),
      ); 
    
  }
}

class productCarouselCard extends StatelessWidget {
  const productCarouselCard({
    super.key, required this.productSlider,
  });
final ProductSlider productSlider; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () {
      
     },
     child: AnimatedContainer(duration: const Duration(
       milliseconds: 300 ),
       decoration: const BoxDecoration(), 
       child: SingleChildScrollView(
         child: Column(
           children: [
             Container(
               height: 320,
               child: Image.asset(productSliders.image),  
             ),
           ],
         ),
       ),
     ),
    );
  }
}



class CircleTabIndicator extends Decoration{
  final Color color;
  double radius; 

  CircleTabIndicator({required this.color, required this.radius});
  
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
  
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  late final double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset = offset + Offset(
      configuration.size!.width / 2, configuration.size!.height - radius); 
      canvas.drawCircle(circleOffset, radius, _paint); 
  }
}
