import 'package:flutter/material.dart';
import 'package:last_test/config/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final appTheme = AppTheme.of(context);
    final colorsScheme = appTheme.colorsScheme;
    return Scaffold(
      backgroundColor: colorsScheme.darkBlue,
      body: Center(
        child: SizedBox(
          width: width,
          child: Stack(alignment: Alignment.center, children: [
            Container(
              width: 132,
              height: 132,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorsScheme.orange,
              ),
            ),
            Positioned(
              left: width / 2 - 40,
              child: Text(
                'Ecommerce\nConcept',
                style: appTheme.textTheme.h1.copyWith(color: colorsScheme.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
