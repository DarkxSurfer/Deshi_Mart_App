import 'package:deshi_mart_app/src/view/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Utils/Constant/colors.dart';
import '../../Utils/Constant/image_strings.dart';
import '../../common/ui_helpers.dart';
import '../../services/Admin LogIn Function/admin_login_function.dart'; // Adjust the path according to your project structure

class AdminLoginScreen extends StatelessWidget {
  // Create an instance of AdminAuth class
  final AdminAuth adminAuth = AdminAuth();

  AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: height *0.18,horizontal: width*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(carrotIcon,scale: 0.5)),
                SizedBox(height: height *0.07),
          
                const Text(
                  'Admin Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text('Enter your emails and password',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                verticalSpaceMedium,

                const Text("Email", style: TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.w500)),
                SizedBox(height: height *0.01),                /// Admin Email
                TextFormField(
                  controller: adminAuth.adminEmail,
                  style: TextStyle(color: theme.primaryColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
          
                ),
                SizedBox(height: height *0.03),


                const Text("Password", style: TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.w500)),
                SizedBox(height: height *0.01),
                /// Admin Password
                TextFormField(
                  controller: adminAuth.adminPassword,
                  style: TextStyle(color: theme.primaryColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:  BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
          
                ),

          
                const SizedBox(height: 16.0),
          
                const SizedBox(height: 32.0),
                SizedBox(
                  height: height * 0.06,
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      adminAuth.adminLogin(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff53B175),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have admin account?",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child:  Text('Sign In',style: TextStyle(color: AColors.green,fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
