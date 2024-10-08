import 'package:deshi_mart_app/src/view/Welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/BottomNavigationMenu/bottom_navigation_menu.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  // Save login status using SharedPreferences
  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Check if user is logged in via SharedPreferences
  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false; // If null, return false
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _checkLoginStatus(),
        builder: (context, sharedPrefSnapshot) {
          // Check if SharedPreferences has a login status saved
          if (sharedPrefSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // If there's an error in SharedPreferences
          if (sharedPrefSnapshot.hasError) {
            return const Center(child: Text('Error checking login status.'));
          }

          // If user is already logged in (from SharedPreferences)
          if (sharedPrefSnapshot.hasData && sharedPrefSnapshot.data == true) {
            return const BottomNavigationMenu();
          }

          // If not logged in, use Firebase authentication to proceed
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(
                    child: Text('Something went wrong. Please try again.'));
              }

              if (snapshot.hasData) {
                // Save login status when user logs in successfully
                _saveLoginStatus(true);
                return const BottomNavigationMenu();
              } else {
                // Clear login status if user is not authenticated
                _saveLoginStatus(false);
                return const WelcomeScreen();
              }
            },
          );
        },
      ),
    );
  }
}
