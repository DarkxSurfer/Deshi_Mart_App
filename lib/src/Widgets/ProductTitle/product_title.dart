import 'package:flutter/material.dart';
import '../../Utils/Constant/colors.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key, required this.title, required this.onPressed,});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
        TextButton(onPressed: onPressed,child:  Text('See all',style: TextStyle(
            color: AColors.green,fontSize: 17,fontWeight: FontWeight.w500))),
      ],
    );
  }
}
