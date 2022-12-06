import 'package:flutter/material.dart';
import 'package:last_test/config/constants/app_colors.dart';

abstract class AppColorsScheme {
  const AppColorsScheme._();

  Color get scaffoldLight;
  Color get white;
  Color get black;
  Color get transparent;
  Color get orange;
  Color get darkBlue;
  Color get red;
  Color get grey;
  Color get shadow;
  Color get lightGrey;
  Color get lightBlue;
}

class LightAppColorsScheme implements AppColorsScheme {
  const LightAppColorsScheme();

  @override
  Color get scaffoldLight => AppColors.scaffoldLight;
  @override
  Color get white => AppColors.white;
  @override
  Color get transparent => AppColors.transparent;
  @override
  Color get orange => AppColors.orange;
  @override
  Color get darkBlue => AppColors.darkBlue;
  @override
  Color get black => AppColors.black;
  @override
  Color get red => AppColors.red;
  @override
  Color get grey => AppColors.grey;
  @override
  Color get shadow => AppColors.shadow;
  @override
  Color get lightGrey => AppColors.lightGrey;
  @override
  Color get lightBlue => AppColors.lightBlue;
}
