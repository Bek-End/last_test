import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_test/config/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? prefixIcon;
  final TextEditingController controller;
  const CustomTextField({
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorsScheme = AppTheme.of(context).colorsScheme;
    return Container(
      padding: const EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
          color: colorsScheme.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: colorsScheme.shadow.withOpacity(0.15),
            )
          ]),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: prefixIcon == null
              ? null
              : Padding(
                  padding: const EdgeInsets.fromLTRB(24, 9, 5, 9),
                  child: SvgPicture.asset(
                    prefixIcon!,
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ),
        ),
      ),
    );
  }
}
