import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
   double getResponsiveWidth(double baseWidth) => screenWidth * (baseWidth / 402);
   double getResponsiveHeight(double baseHeight) => screenHeight * (baseHeight / 874);

   
   
   }