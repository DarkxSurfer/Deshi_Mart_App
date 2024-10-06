import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryModel {
  final String imageAsset;
  final Color color;
  final Color borderColor;
  final String text;
  final Widget? screen;
  CategoryModel(
      {required this.imageAsset,
      this.screen,
      required this.color,
      required this.borderColor,
      required this.text});
}
