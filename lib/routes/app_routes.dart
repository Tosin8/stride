

import 'package:get/get.dart';
import 'package:stride/routes/home/home.dart';


import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: BRoutes.home, page: () => const HomeScreen()), 
      
  ]; 
}