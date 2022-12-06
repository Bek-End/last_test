import 'package:flutter/material.dart';

abstract class AppTextStyles {
  const AppTextStyles._();

  static const String fontFamily = 'Mark-Pro';

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 30,
    letterSpacing: -0.33,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    letterSpacing: -0.33,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    letterSpacing: -0.33,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    letterSpacing: -0.33,
  );
}
