import 'package:deshi_mart_app/firebase_options.dart';
import 'package:deshi_mart_app/src/Widgets/BottomNavigationMenu/bottom_navigation_menu.dart';
import 'package:deshi_mart_app/src/common/Provider/provider_state.dart';
import 'package:deshi_mart_app/src/services/Stripe%20Service/stripe_key.dart';
import 'package:deshi_mart_app/src/services/auth/auth_service.dart';
import 'package:deshi_mart_app/src/view/Admin/SideBarNavigation/sidebar_navigation.dart';
import 'package:deshi_mart_app/src/view/Login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = publishKey;

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
        child: GetMaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.white, // Set theme color to match the AppBar
              elevation: 0, // Remove shadow and elevation
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ));
  }
}
