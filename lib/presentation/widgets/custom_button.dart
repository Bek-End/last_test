import 'package:flutter/material.dart';
import 'package:last_test/config/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Color? color;
  final double borderRadius;
  final double? width;
  const CustomButton({
    required this.text,
    required this.onTap,
    this.borderRadius = 10,
    this.textStyle,
    this.padding,
    this.color,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? colorsScheme.orange,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ??
              appTheme.textTheme.h2.copyWith(
                color: colorsScheme.white,
                fontSize: 20,
              ),
        ),
      ),
    );
  }
}
