import 'package:flutter/material.dart';

class CustomTextform extends StatelessWidget {
  const CustomTextform(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.obscureValue});

  final controller;
  final hintText;
  final prefixIcon;
  final suffixIcon;
  final bool obscureValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      obscureText: obscureValue,
      controller: controller,
      style: TextStyle(color: theme.primaryColor),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: () {},
        ),
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 2, color: Color(0xffE9F1FF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 2, color: Color(0xffE9F1FF)),
        ),
      ),
    );
  }
}
