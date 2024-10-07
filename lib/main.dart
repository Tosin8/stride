import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stride/firebase_options.dart';


import 'auth/repository/auth_repo.dart';
import 'bindings/general_binding.dart';
import 'routes/app_routes.dart';



Future <void> main() async { 
/// widgets binding 
  
  final WidgetsBinding widgetsBinding = 
  WidgetsFlutterBinding.ensureInitialized(); 
  /// getx local storage 
  await GetStorage.init();

  /// await splash until other items load

FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

/// iniitalize firebase and auth. repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  (FirebaseApp value) => Get.put(AuthenticationRepository()), 
  ); 

  // load all the material design; 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stride',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home:
      const Scaffold(
        backgroundColor: Colors.white, 
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white),))
      // const SplashScreen(),
    );
  }
}

