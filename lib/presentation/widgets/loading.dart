import 'package:flutter/material.dart';
import 'package:last_test/config/theme/app_theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).colorsScheme.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
