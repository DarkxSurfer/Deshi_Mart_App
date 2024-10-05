import 'dart:ui';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Otp/otp_screen.dart';

class EnterNumberScreen extends StatefulWidget {
  const EnterNumberScreen({super.key});

  @override
  State<EnterNumberScreen> createState() => _EnterNumberScreenState();
}

final _phoneFormKey = GlobalKey<FormState>();
final TextEditingController _phoneNumberController = TextEditingController();
String _countryCode = '+92'; // Default country code

// A mapping of country codes to expected phone number lengths
const Map<String, int> countryCodeLengths = {
  '+92': 10, // Example for Pakistan
  // Add more country codes and their lengths here
};

class _EnterNumberScreenState extends State<EnterNumberScreen> {
  void _submitPhoneNumber() {
    if (_phoneFormKey.currentState!.validate()) {
      // Proceed to the next step (e.g., OTP screen)
      if (kDebugMode) {
        print('Phone Number: $_countryCode${_phoneNumberController.text}');
      }
      // Use Navigator to navigate to the OTP screen here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width *0.04),
            child: Column(
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
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Enter your mobile number',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                      ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'Mobile Number',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Form(
                            key: _phoneFormKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    prefixIcon: CountryCodePicker(
                                      onChanged: (value) {
                                        setState(() {
                                          _countryCode = value.dialCode!;
                                        });
                                      },
                                      initialSelection: 'PK',
                                      favorite: const ['+92', 'PK'],
                                    ),
                                    // border: const OutlineInputBorder(
                                    //   borderRadius:
                                    //       BorderRadius.all(Radius.circular(20)),
                                    // ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number.';
                                    } else if (!RegExp(r'^[0-9]+$')
                                        .hasMatch(value)) {
                                      return 'Invalid Phone Number: Only digits allowed.';
                                    } else if ((value.length !=
                                        (countryCodeLengths[_countryCode] ??
                                            10))) {
                                      return 'Invalid Phone Number: Should be ${countryCodeLengths[_countryCode]} digits for $_countryCode.';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AColors.green,

            onPressed: () {
              if (_phoneFormKey.currentState!.validate()) {
                String fullPhoneNumber =
                    _countryCode + _phoneNumberController.text;
                Get.to(const OtpScreen());

                // Proceed with phone number submission, OTP sending, etc.
              }
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ), // Icon for the FAB
          )),
    );
  }
}
