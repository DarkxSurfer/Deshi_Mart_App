import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
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
            return AlertDialog(
              title: Center(
                child: CircularProgressIndicator(color: AColors.green),
              ),
            );
          });

      // Retrieve the admin document only once
      var documentSnapshot =
          await firestore.collection('admin').doc('adminLogin').get();

      if (documentSnapshot.exists) {
        // Check if email and password match
        if (documentSnapshot.data()?['adminEmail'] == adminEmail.text &&
            documentSnapshot.data()?['adminPassword'] == adminPassword.text) {
          // Dismiss the dialog
          Navigator.of(context).pop();

          // Navigate to Admin Home Screen using GetX
          Get.offAll(() => const Sidebar());
        } else {
          Navigator.of(context).pop();
          Get.snackbar('Login Failed', 'Incorrect email or password',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.deepOrange);
        }
      } else {
        Navigator.of(context).pop();
        Get.snackbar('Error', 'Admin record not found',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.deepOrange);
      }
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss dialog if there's an error
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.deepOrange);
    }
  }
}
