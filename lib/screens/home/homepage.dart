// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                     Container(color: Colors.red,), 
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
