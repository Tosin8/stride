
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/general_binding.dart';
import 'routes/app_routes.dart';
import 'utils/colors.dart';





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qwibix',
      themeMode: ThemeMode.system,
      // theme: ThemeData(
        
      
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),

      // theme: BAppTheme.lightTheme, 
      // darkTheme: BAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: BColors.primary, 
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white),))
      
      //const OnBoardingScreen()
    ); 
    
  }
}

