import 'package:deshi_mart_app/src/view/Login/login_screen.dart';
import 'package:deshi_mart_app/src/view/PhoneNo/EnterNumber/enter_number_screen.dart';
import 'package:deshi_mart_app/src/view/PhoneNo/Otp/otp_screen.dart';
import 'package:deshi_mart_app/src/view/PhoneNo/PhoneLogin/phone_login_screen.dart';
import 'package:deshi_mart_app/src/view/Splash/splash_screen.dart';
import 'package:deshi_mart_app/src/view/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
