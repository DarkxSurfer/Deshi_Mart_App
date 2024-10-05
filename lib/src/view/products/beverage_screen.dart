import 'package:deshi_mart_app/src/Widgets/BottomNavigationMenu/beverageProductCard/beverageGridList.dart';
import 'package:flutter/material.dart';

class BeverageScreen extends StatelessWidget {
  const BeverageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Beverages',
            style:
                TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.06),
          child: Column(
            children: [SizedBox(height: height * 1, child: BeverageGridList())],
          ),
        ),
      ),
    );
  }
}
