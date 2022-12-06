import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_test/config/theme/app_theme.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final Color? colorButton;
  const CustomIconButton({
    required this.icon,
    required this.onTap,
    this.colorButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorsScheme = AppTheme.of(context).colorsScheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 37,
        height: 37,
        decoration: BoxDecoration(
          color: colorButton ?? colorsScheme.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            color: colorsScheme.white,
          ),
        ),
      ),
    );
  }
}
