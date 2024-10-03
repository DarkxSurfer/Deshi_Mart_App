import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/Widgets/custom_textform.dart';
import 'package:deshi_mart_app/src/common/ui_helpers.dart';
import 'package:deshi_mart_app/src/view/Login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/firebase/signin_func.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(carrotIcon),
            verticalSpaceMassive,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SignUp',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text('Enter your emails and password',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                verticalSpaceMedium,

                const Text("Username",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                CustomTextform(
                  obscureValue: false,
                  controller: usernameController,
                  prefixIcon: Icons.person_outline,
                ),
                verticalSpaceSmall,
                const Text("Email",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                CustomTextform(
                  obscureValue: false,
                  controller: emailController,
                  prefixIcon: Icons.email_outlined,
                ),
                verticalSpaceSmall,

                const Text("Password",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                CustomTextform(
                  obscureValue: true,
                  controller: passController,
                  prefixIcon: Icons.lock_outline,
                ),
                verticalSpaceSmall,

                // Forgot Password Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'By continuing you agree to our ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: AColors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the tap event for Terms of Service
                          },
                      ),
                      const TextSpan(
                        text: '\n', // New line added here
                      ),
                      const TextSpan(
                        text: 'and ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(
                          color: AColors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the tap event for Privacy Policy
                          },
                      ),
                    ]))
                  ],
                ),
                verticalSpaceSmall,

                SizedBox(
                  height: height * 0.06,
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      registerUser(context, emailController.text,
                          passController.text, usernameController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff53B175),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
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
                    const Text('Already have an account? ',
                        style: TextStyle(color: Color(0xff868D95))),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: const Text('Login',
                          style: TextStyle(color: Color(0xff53B175))),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
