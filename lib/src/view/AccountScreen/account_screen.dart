import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/services/firebase/signin_func.dart';
import 'package:deshi_mart_app/src/view/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Profile/order_detail_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
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
                        const Text(
                          'Afsar Hossein',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Imshuvo97@gmail.com',
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
                  _saveLoginStatus(false);
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
