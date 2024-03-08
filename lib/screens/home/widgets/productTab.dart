import 'package:flutter/material.dart';
import 'package:stride/common/widgets/circletabindictor.dart';

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
