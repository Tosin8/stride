import 'package:flutter/material.dart';
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
             
              const Text('Collection', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),), 
             
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
                      color:Colors.black12,
                       radius: 4),
                    tabs: [
                      const Tab(
                        child: Text('Popular',
                        ),
                      ), 
                       const Tab(
                        child: Text('Adidas',
                        ),
                      ),
                       const Tab(
                        child: Text('Jordan',
                         ),
                      ),
                       const Tab(
                        child: Text('Nike',
                        ),
                      ),
                       const Tab(
                        child: Text('Puma',
                      ),
                      ),
                  
                  ]),
                ),
              
              Container(
                child:  TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      child:  Text('Popular'),
                    ), 
                    Container(
                      child:  Text('Adidas'),
                    ), 
                    Container(
                      child:  Text('Jordan'),
                    ), 
                    Container(
                      child:  Text('Nike'),
                    ), 
                    Container(
                      child:  Text('Puma'),
                    )
                  ]),
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