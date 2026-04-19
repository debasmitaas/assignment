import 'package:assignment/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
   static TextStyle get title1 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    letterSpacing: -0.5,
  );

  static TextStyle get title2 => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold, 
    color: Colors.black87,
  );

  static TextStyle get subtitleText => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.greyColor,
    height: 1.5,
  );
}
