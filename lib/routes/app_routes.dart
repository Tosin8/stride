

import 'package:get/get.dart';
import 'package:stride/screens/shop/home/home.dart';


import '../auth/forms/login.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: BRoutes.home, page: () => const HomeScreen()),
        GetPage(name: BRoutes.signIn, page: () => const LoginScreen()), 
      
  ]; 
}