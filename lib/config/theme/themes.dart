import 'package:flutter/material.dart';
import 'package:last_test/config/constants/app_colors.dart';

import 'app_text_theme.dart';

abstract class Themes {
  const Themes._();

  static ThemeData get lightTheme {
    const textTheme = LightAppTextTheme();

    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffoldLight,
      colorScheme: const ColorScheme.light(
        secondary: AppColors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.transparent,
        shadowColor: AppColors.transparent,
        centerTitle: true,
        titleTextStyle: textTheme.h3.copyWith(fontSize: 15),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.darkBlue,
      ),
      tabBarTheme: TabBarTheme(
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.orange,
              width: 3,
            ),
          ),
        ),
        labelPadding: const EdgeInsets.only(bottom: 8),
        labelColor: AppColors.darkBlue,
        labelStyle: textTheme.h2.copyWith(fontSize: 20),
        unselectedLabelColor: AppColors.black.withOpacity(0.5),
        unselectedLabelStyle: textTheme.h4.copyWith(fontSize: 20),
      ),
      shadowColor: AppColors.shadow.withOpacity(0.15),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle:
              MaterialStateProperty.all(textTheme.h4.copyWith(fontSize: 15)),
          foregroundColor: MaterialStateProperty.all(AppColors.orange),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(0),
        hintStyle: textTheme.h4
            .copyWith(fontSize: 12, color: AppColors.darkBlue.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
      ),
    );
  }
}
