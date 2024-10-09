import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/view/Admin/Admin%20Home/admin_home_screen.dart';
import 'package:deshi_mart_app/src/view/Admin/SideBarNavigation/sidebar_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminAuth {
  TextEditingController adminEmail = TextEditingController();
  TextEditingController adminPassword = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void adminLogin(BuildContext context) async {
    try {
      // Show Progress Indicator
      showDialog(
        context: context,
        builder: (context) {
          /// weighting prognosticator
          return AlertDialog(
            title: Center(
              child: TweenAnimationBuilder(
                tween:
                    Tween<double>(begin: 0, end: 1), // Animation from 0 to 100%
                duration: const Duration(seconds: 2), // 1.5 seconds
                builder: (context, value, child) {
                  return CircularProgressIndicator(
                      // value: value, // Sets progress value
                      color: AColors.green);
                },
              ),
            ),
          );
        },
      );

      /// Retrieve the admin document only once
      var documentSnapshot =
          await firestore.collection('admin').doc('adminLogin').get();

      if (documentSnapshot.exists) {
        /// Check if email and password match
        if (documentSnapshot.data()?['adminEmail'] == adminEmail.text &&
            documentSnapshot.data()?['adminPassword'] == adminPassword.text) {
          /// Dismiss the dialog
          Get.back();
          // Navigate to Admin Home Screen using GetX
          Get.offAll(() => const Sidebar());
        } else {
          Get.back();
          Get.snackbar('Login Failed', 'Incorrect email or password',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.deepOrange);
        }
      } else {
        Get.back();
        Get.snackbar('Error', 'Admin record not found',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.deepOrange);
      }
    } catch (e) {
      Get.back();

      /// Dismiss dialog if there's an error
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.deepOrange);
    }
  }
}
