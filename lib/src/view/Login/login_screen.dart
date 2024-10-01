import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/Widgets/custom_textform.dart';
import 'package:deshi_mart_app/src/common/ui_helpers.dart';
import 'package:deshi_mart_app/src/view/SelectLocation/select_location_screen.dart';
import 'package:deshi_mart_app/src/view/SignUp/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                      Get.offAll(() => const SelectLocationScreen());
                      // _signInUser(context);
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
                    const Text('Dont have an account? ',
                        style: TextStyle(color: Color(0xff868D95))),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      child: const Text('Sign Up',
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
