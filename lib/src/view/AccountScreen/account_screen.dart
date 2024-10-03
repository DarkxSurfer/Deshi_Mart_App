import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/services/firebase/signin_func.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../Profile/order_detail_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _userName = 'Loading...';
  // Default text while loading
  String _userEmail = '@unknown_user';
  // Default email
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the screen initializes
  }

  Future<void> _fetchUserData() async {
    try {
      String userId = _firebaseAuth.currentUser!.uid; // Get current user ID
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        setState(() {
          _userName =
              userDoc['name'] ?? 'Unknown User'; // Fetch name from Firestore
          _userEmail =
              userDoc['email'] ?? '@unknown_user'; // Fetch email if needed
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, top: height * 0.07),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Profile menu
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.purple,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: width * 0.05),
                    // SizedBox(height:  height *0.0),
                    /// user Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          _userEmail,
                          style: TextStyle(color: AColors.textLight),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_outlined,
                          color: AColors.green,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            const Divider(),

            ///Order
            AccountListWidgets(
                title: 'Orders',
                onTap: () {
                  Get.to(() => const OrderDetailScreen());
                },
                icon: Iconsax.shopping_bag),
            const Divider(),

            ///My Details
            AccountListWidgets(
                title: 'My Details', onTap: () {}, icon: Iconsax.personalcard),
            const Divider(),

            ///Delivery Address
            AccountListWidgets(
                title: 'Delivery Address',
                onTap: () {},
                icon: Iconsax.location),
            const Divider(),

            ///Payment
            AccountListWidgets(
                title: 'Payment Methods',
                onTap: () {},
                icon: Iconsax.ticket_discount),
            const Divider(),

            ///Notifications
            AccountListWidgets(
                title: 'Notifications ',
                onTap: () {},
                icon: Iconsax.notification),
            const Divider(),

            ///Help
            AccountListWidgets(
                title: 'Help', onTap: () {}, icon: Icons.help_outline),
            const Divider(),

            ///About
            AccountListWidgets(
                title: 'About', onTap: () {}, icon: Iconsax.warning_2),
            const Divider(),
            SizedBox(height: height * 0.05),

            /// Log Out Button
            SizedBox(
              height: height * 0.05,
              width: width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  signOut(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.exit_to_app_outlined, color: AColors.green),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        'Log Out',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AColors.green,
                            fontSize: 19,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.06,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountListWidgets extends StatelessWidget {
  const AccountListWidgets({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: IconButton(
          onPressed: onTap,
          icon: const Icon(Icons.chevron_right_rounded, size: 32)),
    );
  }
}
