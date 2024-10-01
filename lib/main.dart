import 'package:deshi_mart_app/src/view/Admin/SideBarNavigation/sidebar_navigation.dart';
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
      home: Sidebar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
