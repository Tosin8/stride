// import 'package:flutter/material.dart';

// import 'package:stride/splash.dart';

// import 'runs.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Stride',
//       theme: ThemeData(
        
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const Runs(),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
      runApp(
        MaterialApp(
        home: Scaffold(
          body: 
          NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: const Text('NestedScrollView Example'),
            pinned: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              tabs: List<Widget>.generate(10, (int index) {
                return Tab(text: 'Tab $index');
              }),
            ),
          ),
        ];
      },
      body: TabBarView(
        children: List<Widget>.generate(10, (int index) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  key: PageStorageKey<int>(index),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverFixedExtentList(
                        itemExtent: 48.0,
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return ListTile(
                              title: Text('Item $index'),
                            );
                          },
                          childCount: 30,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }),
      ),
    )
        )
        )
        );
        }