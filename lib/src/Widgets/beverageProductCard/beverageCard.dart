import 'package:deshi_mart_app/src/Models/beveragesModel.dart/beveragesModel.dart';
import 'package:deshi_mart_app/src/Utils/Constant/colors.dart';
import 'package:flutter/material.dart';

class Beveragecard extends StatelessWidget {
  final BeveragesModel beverage;
  final onTap;
  const Beveragecard({super.key, this.onTap, required this.beverage});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03),
        height: height * 0.35,
        width: width * 0.45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// under Card Image
            Center(
              child: Image(
                  alignment: Alignment.center,
                  image: AssetImage(beverage.image),
                  height: height * 0.12,
                  fit: BoxFit.cover),
            ),

            SizedBox(height: height * 0.01),

            /// title
            Text(beverage.title,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 3),
            Text(beverage.subtitle,
                style: TextStyle(fontSize: 15, color: AColors.textLight)),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// card Price
                Text(beverage.price,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
