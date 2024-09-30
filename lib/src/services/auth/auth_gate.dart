import 'package:deshi_mart_app/src/view/Home/home_screen.dart';
import 'package:deshi_mart_app/src/view/Splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Loading state while checking authentication
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // If there's an error
          if (snapshot.hasError) {
            return const Center(
                child: Text('Something went wrong. Please try again.'));
          }

          // If the user is authenticated, show the main navigation
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            // If the user is not authenticated, show the login screen
            return const SplashScreen();
          }
        },
      ),
    );
  }
}
