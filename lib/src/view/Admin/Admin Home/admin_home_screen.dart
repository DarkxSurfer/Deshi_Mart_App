import 'package:flutter/material.dart';
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Home Screen for Admin',style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
    );
  }
}
