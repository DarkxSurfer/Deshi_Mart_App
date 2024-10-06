import 'dart:async';
import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const AuthGate()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00CA44),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(logoWhite),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('DESHI MART',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                // SizedBox(
                //   width: 20,
                // ),
                // CircularProgressIndicator(
                //   color: Colors.white,
                //   // strokeWidth: 6,
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
