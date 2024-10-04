
import 'package:get/get.dart';


import '../features/authentication/controllers/login/login_controller.dart';
import '../utils/http/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager()); 
     Get.lazyPut(() => LoginController(), fenix: true);
  }
}