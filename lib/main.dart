import 'package:deshi_mart_app/firebase_options.dart';
import 'package:deshi_mart_app/src/common/Provider/provider_state.dart';
import 'package:deshi_mart_app/src/services/auth/auth_service.dart';
import 'package:deshi_mart_app/src/view/Splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    // Handle errors during Firebase initialization
    if (kDebugMode) {
      print("Error initializing Firebase: $e");
    }
    return; // Exit the app if Firebase fails to initialize
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavouriteItem()),
          ChangeNotifierProvider(
            create: (context) => AuthService(),
          )
        ],
        child: const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
