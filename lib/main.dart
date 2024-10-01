import 'package:deshi_mart_app/src/Widgets/BottomNavigationMenu/bottom%20_navigation_menu.dart';
import 'package:deshi_mart_app/src/common/Provider/provider_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => FavouriteItem())],
    child: const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationMenu(),
    )
    );
  }
}
