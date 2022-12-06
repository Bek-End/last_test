import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_test/config/theme/app_theme.dart';

class CircleIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final Color buttonColor;
  final Color iconColor;
  final double width;
  final double height;
  const CircleIconButton({
    required this.icon,
    required this.onTap,
    required this.buttonColor,
    required this.width,
    required this.height,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: colorsScheme.shadow.withOpacity(0.15),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
