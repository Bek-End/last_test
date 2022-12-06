import 'package:flutter/material.dart';
import 'package:last_test/config/constants/app_colors.dart';
import 'package:last_test/config/constants/app_text_styles.dart';

class AppTextTheme {
  final Color defaultColor;

  const AppTextTheme({
    required this.defaultColor,
  });

  Color get _textColor => defaultColor;

  String get fontFamily => AppTextStyles.fontFamily;

  TextStyle get h1 => AppTextStyles.h1.copyWith(color: _textColor);
  TextStyle get h2 => AppTextStyles.h2.copyWith(color: _textColor);
  TextStyle get h3 => AppTextStyles.h3.copyWith(color: _textColor);
  TextStyle get h4 => AppTextStyles.h4.copyWith(color: _textColor);
}

class LightAppTextTheme extends AppTextTheme {
  const LightAppTextTheme() : super(defaultColor: AppColors.darkBlue);
}
