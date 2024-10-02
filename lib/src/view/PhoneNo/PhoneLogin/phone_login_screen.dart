import 'package:country_code_picker/country_code_picker.dart';
import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/common/ui_helpers.dart';
import 'package:deshi_mart_app/src/view/Login/login_screen.dart';
import 'package:deshi_mart_app/src/view/PhoneNo/EnterNumber/enter_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.5,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(phoneLoginBg),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Get your groceries \nwith nectar",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(const EnterNumberScreen()),
                    child: Container(
                      color: Colors.white,
                      height: 60,
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CountryCodePicker(
                            initialSelection: 'PK',
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.6),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text("Or connect with social media",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.withOpacity(0.9),
                            fontWeight: FontWeight.w500)),
                  ),
                  verticalSpaceSmall,
                  Center(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color(0xff5383EC), // Text and icon color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),

                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ), // Facebook icon
                        label: const Text('Continue with Google'),
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Center(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color(0xff4A66AC), // Text and icon color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),

                        icon: const FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.white,
                        ), // Facebook icon
                        label: const Text('Continue with Facebook'),
                        onPressed: () {
                          // Handle Facebook login
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
