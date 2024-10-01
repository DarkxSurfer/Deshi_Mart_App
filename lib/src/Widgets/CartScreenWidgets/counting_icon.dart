import 'package:flutter/material.dart';

class CountingIcons extends StatelessWidget {
  const CountingIcons({
    super.key, required this.icon, this.color, required this.onPressed,

  });

  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height * 0.04,
        width: width * 0.09,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Icon(icon,color: color),
      ),
    );
  }
}
