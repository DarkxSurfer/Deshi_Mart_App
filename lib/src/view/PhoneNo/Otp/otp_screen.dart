import 'dart:ui';

import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpFormKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  void _submitOtp() {
    if (_otpFormKey.currentState!.validate()) {
      // Proceed with OTP verification
      print('OTP entered: ${_otpController.text}');
      // Navigate to the next screen, e.g., home or success screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.5,
                      width: width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(phoneLoginBg), // Your image asset
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 70.0, sigmaY: 70.0),
                        child: Container(
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Positioned(
                        left: 0,
                        right: 0,
                        top: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Enter your 4-digit code',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            const Text(
                              '     Code',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            Form(
                              key: _otpFormKey,
                              child: TextFormField(
                                controller: _otpController,
                                keyboardType: TextInputType.number,
                                maxLength: 6, // Assuming a 6-digit OTP
                                decoration: const InputDecoration(
                                  hintText: '- - -  - - -',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  counterText: '', // Hide the counter text
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the OTP.';
                                  } else if (value.length != 6) {
                                    return 'OTP must be 6 digits.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Implement resend OTP functionality here
                        print('Resend OTP');
                      },
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(color: AColors.green),
                      ),
                    ),
                  ],
                )
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AColors.green,

          onPressed: _submitOtp,
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ), // Icon for the FAB
        ));
  }
}
