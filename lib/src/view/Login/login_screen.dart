import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/common/ui_helpers.dart';
import 'package:deshi_mart_app/src/services/firebase/signin_func.dart';
import 'package:deshi_mart_app/src/view/Admin%20Login/admin_login.dart';
import 'package:deshi_mart_app/src/view/SignUp/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/custom_text_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.15, horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(carrotIcon, scale: 0.8),
                SizedBox(height: height * 0.07),
                // verticalSpaceMassive,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('Enter your emails and password',
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    verticalSpaceMedium,

                    const Text("Email",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    CustomTextForm(
                      obscureValue: false,
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: height * 0.03),
                    const Text("Password",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    CustomTextForm(
                      obscureValue: true,
                      controller: passController,
                      prefixIcon: Icons.lock_outline,
                    ),
                    verticalSpaceSmall,

                    // Forgot Password Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Add your forgot password logic
                          },
                          child: const Text('Forgot Password?',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,

                    SizedBox(
                      height: height * 0.06,
                      width: width,
                      child: ElevatedButton(
                        onPressed: () {
                          _signInUser(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff53B175),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        TextButton(
                          onPressed: () {
                            Get.to(() => SignupScreen());
                          },
                          child: Text('SignUp',
                              style: TextStyle(
                                  color: AColors.green,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.offAll(() => AdminLoginScreen());
                            },
                            child: Text(
                              'Admin Login',
                              style:
                                  TextStyle(fontSize: 18, color: AColors.green),
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signInUser(BuildContext context) {
    final email = emailController.text;
    final password = passController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email and Password cannot be empty')),
      );
      return;
    }

    signIn(context, email, password);
  }
}
