import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stride/firebase_options.dart';

import 'auth/repository/auth_repo.dart';
import 'bindings/general_binding.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  // Ensure widgets binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
  await GetStorage.init();

  // Preserve the native splash screen until initialization is complete
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  try {
    // Initialize Firebase and the authentication repository
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    Get.put(AuthenticationRepository());
  } catch (e) {
    // Handle any errors during Firebase initialization
    print("Error initializing Firebase: $e");
  } finally {
    // Hide the splash screen once initialization is done
    FlutterNativeSplash.remove();
  }

  // Load the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple, // Match with your theme
          ),
        ),
      ),
    );
  }
}
