import 'package:deshi_mart_app/src/Widgets/productCard/categoryModel.dart';
import 'package:deshi_mart_app/src/Widgets/productCard/productGridCard.dart';
import 'package:deshi_mart_app/src/view/products/beverage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productgridlist extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(
      imageAsset: 'assets/images/f1.png',
      color: const Color(0xff53b175).withOpacity(0.1),
      borderColor: const Color(0xff53b175).withOpacity(0.7),
      text: 'Fresh Fruits\n& Vegetables',
    ),
    CategoryModel(
        imageAsset: 'assets/images/f2.png',
        color: const Color(0xfff8a44c1a).withOpacity(0.1),
        borderColor: const Color(0xfff8a44c1a).withOpacity(0.7),
        text: 'Cooking Oil\n& Ghee'),
    CategoryModel(
        imageAsset: 'assets/images/f3.png',
        color: const Color(0xffF7A593).withOpacity(0.25),
        borderColor: const Color(0xffF7A593),
        text: 'Meet & Fish'),
    CategoryModel(
        imageAsset: 'assets/images/f4.png',
        color: const Color(0xffD3B0E0).withOpacity(0.1),
        borderColor: const Color(0xffD3B0E0),
        text: 'Bakery & Snacks'),
    CategoryModel(
        imageAsset: 'assets/images/f5.png',
        color: const Color(0xffFDE598).withOpacity(0.25),
        borderColor: const Color(0xffFDE598),
        text: 'Dairy & Eggs'),
    CategoryModel(
        screen: const BeverageScreen(),
        imageAsset: 'assets/images/f6.png',
        color: const Color(0xffB7DFF5).withOpacity(0.25),
        borderColor: const Color(0xffB7DFF5),
        text: 'Beverages'),
  ];
  Productgridlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15.0, crossAxisSpacing: 13,
          childAspectRatio: 0.8, // Adjust the aspect ratio (width / height)
        ),
        itemBuilder: (context, index) {
          // Ensure you're not accessing an out-of-bounds index
          if (index < categories.length) {
            return Productgridcard(
              categorymodel: categories[index],
              // onTap: () => Get.to(() => const BeverageScreen()),
            );
          } else {
            return const SizedBox
                .shrink(); // Return an empty widget if index is out of bounds
          }
        });
  }
}
