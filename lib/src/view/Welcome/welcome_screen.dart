import 'package:deshi_mart_app/src/Utils/Constant/image_strings.dart';
import 'package:deshi_mart_app/src/common/ui_helpers.dart';
import 'package:deshi_mart_app/src/view/SelectLocation/select_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: 2.0, left: 25, right: 25, top: height * 0.08),
            child: Column(
              children: [
                Image.asset(logocolor),
                const Row(
                  children: [
                    Text(
                      "DESHI",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff00CA44),
                          fontWeight: FontWeight.bold),
                    ),
                    horizontalSpaceTiny,
                    Text(
                      "MART",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffF6921E),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  "Desh ka market",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Row(
                  children: [
                    Image.asset(leafIcon),
                    horizontalSpaceMedium,
                    const Text(
                      "Organic Groceries",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Image.asset(turkeyIcon),
                    horizontalSpaceMedium,
                    const Text(
                      "Whole food and vegetables",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Image.asset(truckIcon),
                    horizontalSpaceMedium,
                    const Text(
                      "Fask Delivery",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Image.asset(moneyIcon),
                    horizontalSpaceMedium,
                    const Text(
                      "Easy refund and return",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Image.asset(secureIcon),
                    horizontalSpaceMedium,
                    const Text(
                      "Secure And Safe",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.3,
            width: width,
            decoration: const BoxDecoration(
                color: Color(0xff00CA44),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Welcome to our Store',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35)),
                    Text("Get your grocery in as fast as one hours",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: height * 0.04),
                    SizedBox(
                        height: height * 0.05,
                        width: width * 0.7,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.offAll(() => const SelectLocationScreen());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: const Text('Get Started',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
