import 'dart:ui';

import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:deshi_mart_app/src/Widgets/CartScreenWidgets/counting_icon.dart';
import 'package:deshi_mart_app/src/common/Provider/provider_state.dart';
import 'package:deshi_mart_app/src/view/Home/Item%20Models/fruits_model_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../view/Home/home_screen.dart';

class DetailScreenModel extends StatelessWidget {
  const DetailScreenModel({
    super.key,
    required this.product,
  });

  final ItemModel product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FavouriteItem>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.withOpacity(0.6),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ios_share_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Fix for Expanded widget usage
              Container(
                color: Colors.grey.withOpacity(0.6),
                height: height * 0.4, // Adjust height accordingly
                child: Image.asset(product.productThumbNail),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.productName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: height * 0.02),
                              Text(product.productDescription),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              value.favouriteSelected(product);
                            },
                            icon: Icon(
                              value.selectedFavourites.contains(product)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                            ),
                            color: value.selectedFavourites.contains(product)
                                ? AColors.green
                                : Colors.black,
                          ),
                        ]),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            /// Remove Button
                            CountingIcons(
                              icon: Icons.remove,
                              color: AColors.textLight,
                              onPressed: () {},
                            ),
                            SizedBox(width: width * 0.03),

                            /// Quantity Display
                            const Text(
                              "1", // Display current quantity
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: width * 0.03),

                            /// Add Button
                            CountingIcons(
                              icon: Icons.add,
                              color: AColors.green,
                              onPressed: () {
                                // Update quantity logic here
                              },
                            ),
                            SizedBox(width: width * 0.20),
                          ],
                        ),
                        Text(
                          product.unitPrice,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    const Divider(),
                    SizedBox(height: height * 0.02),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Detail',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: height * 0.02),
                    const Divider(),
                    SizedBox(height: height * 0.02),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nutritions',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.keyboard_arrow_right_outlined)
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    const Divider(),
                    SizedBox(height: height * 0.02),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Review',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: height * 0.06,
            width: width,
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(() => const HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff53B175),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Add To Basket',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
    });
  }
}
