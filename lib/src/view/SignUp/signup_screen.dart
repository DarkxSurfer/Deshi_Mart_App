import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/common/ui_helpers.dart';
import 'package:deshi_mart_app/src/view/Login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/custom_text_form.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar:  AppBar(
          toolbarHeight: height * 0.10,
            leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios)),
          backgroundColor: theme.scaffoldBackgroundColor),
        backgroundColor: theme.scaffoldBackgroundColor,
           body: SingleChildScrollView(
             child: Padding(
               padding:  EdgeInsets.symmetric(vertical: height *0.01,horizontal: width*0.05),
               child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(carrotIcon,scale: 0.8),
                SizedBox(height: height *0.09),
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
                    CustomTextForm(
                      obscureValue: false,
                      controller: usernameController,
                      prefixIcon: Icons.person_outline,
                    ),
                    verticalSpaceSmall,
                    const Text("Email",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    CustomTextForm(
                      obscureValue: false,
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                    ),
                    verticalSpaceSmall,

                    const Text("Password",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    CustomTextForm(
                      obscureValue: true,
                      controller: passController,
                      prefixIcon: Icons.lock_outline,
                    ),
                    SizedBox(height: height *0.02),
                    // Forgot Password Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(children: [
                           TextSpan(
                            text: 'By continuing you agree to our ',
                            style: TextStyle(color: AColors.textLight),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              color: AColors.green),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle the tap event for Terms of Service
                              },
                          ),
                          const TextSpan(
                            text: '\n', // New line added here
                          ),
                           TextSpan(
                            text: 'and ',
                            style: TextStyle(color:AColors.textLight),
                          ),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: TextStyle(color: AColors.green),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle the tap event for Privacy Policy
                              },
                          ),
                        ]))
                      ],
                    ),
                    SizedBox(height: height *0.04),
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
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: height *0.02),
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
           ),
      ),
    );
  }
}
