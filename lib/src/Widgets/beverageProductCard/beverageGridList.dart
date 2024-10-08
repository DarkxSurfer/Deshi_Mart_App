import 'package:deshi_mart_app/src/Models/beveragesModel.dart/beveragesModel.dart';
import 'package:deshi_mart_app/src/Widgets/beverageProductCard/beverageCard.dart';
import 'package:flutter/material.dart';

class BeverageGridList extends StatelessWidget {
  final List<BeveragesModel> beverage = [
    BeveragesModel(
        'assets/images/c1.png', 'Diet Coke', '355ml, Price', '\$1.99'),
    BeveragesModel(
        'assets/images/c2.png', 'Sprite Can', '325ml, Price', '\$1.99'),
    BeveragesModel(
        'assets/images/c3.png', 'Apple & Grape Juice', '2L, Price', '\$1.76'),
    BeveragesModel(
        'assets/images/c4.png', 'Orenge Juice', '2L, Price', '\$1.99'),
    BeveragesModel(
        'assets/images/c5.png', 'Coca Cola Can', '325ml, Price', '\$1.09'),
    BeveragesModel(
        'assets/images/c6.png', 'Pepsi Can', '330ml, Price', '\$1.97'),
  ];
  BeverageGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 15.0, crossAxisSpacing: 13,
          childAspectRatio: 0.68, // Adjust the aspect ratio (width / height)
        ),
        itemBuilder: (context, index) {
          // Ensure you're not accessing an out-of-bounds index
          if (index < beverage.length) {
            return Beveragecard(
              beverage: beverage[index],
            );
          } else {
            return const SizedBox
                .shrink(); // Return an empty widget if index is out of bounds
          }
        });
  }
}
