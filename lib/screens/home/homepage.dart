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
              
               Container(
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
                          height: 440, 
                        
                          aspectRatio: 16/9, 
                          viewportFraction: 0.70, 
                          enlargeCenterPage: true, 
                        ),
                        items: List.generate(
                          productSliders.length,
                         (index) => productCarouselCard(
                           productSliders: productSliders[index],
                         ) )
                        ),
                     ), 
                        const Text('Popular'),
                      
                       const Text('Adidas'),
                      
                      
                       
                       const Text('Nike'),
                    
                       const Text('Puma'),
                      
                    ]),
                ),
              
            ],
          ),
        ),
      ); 
    
  }
}

class productCarouselCard extends StatelessWidget {
  const productCarouselCard({
    super.key, required this.productSliders,
  });
final ProductSlider productSliders; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () {
      
     },
     child: AnimatedContainer(
      duration: const Duration(
       milliseconds: 300 
       ),
       decoration:  BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), 
            blurRadius: 20, 

            offset: const Offset(0, 5), 
          )
        ]), 
       child: SingleChildScrollView(
         child: Column(
           children: [
             Container(
               height: 280,
               width: 300,
               clipBehavior: Clip.hardEdge,
               margin: const EdgeInsets.only(top: 10), 
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), 
               ),
               child: Image.asset(productSliders.image, 
               fit: BoxFit.cover,), 
                
             ),
             const SizedBox(height: 20,), 
             Text(productSliders.title, 
             style: const TextStyle(
              fontSize: 20,
               fontWeight: FontWeight.bold),), 
               const SizedBox(height: 8),
               Text(productSliders.category, style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),),  
               const SizedBox(height: 8),
               Text(productSliders.price.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 16),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40, width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10), 
                          ),
                          color: Colors.black,
                        ),
                        child: Icon(Icons.add, color: Colors.white,size: 30,),
                      ), 
                      SizedBox(width: 20,), 
                    ],
                  ) 
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
