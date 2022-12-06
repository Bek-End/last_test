import 'package:flutter/material.dart';

import 'app_colors_scheme.dart';
import 'app_text_theme.dart';

abstract class AppTheme {
  static AppThemeData of(BuildContext context) {
    final inheritedAppTheme = context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>();

    return inheritedAppTheme?.data ?? AppThemeData.fallback();
  }
}

class AppThemeWidget extends StatefulWidget {
  final Widget child;

  const AppThemeWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<AppThemeWidget> createState() => _AppThemeWidgetState();
}

class _AppThemeWidgetState extends State<AppThemeWidget> {
  late AppThemeData _appThemeData;
  Brightness? _previousBrightness;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final theme = Theme.of(context);
    final AppColorsScheme colorsScheme;
    final AppTextTheme textTheme;

    switch (theme.brightness) {
      case Brightness.dark:
      case Brightness.light:
        colorsScheme = const LightAppColorsScheme();
        textTheme = const LightAppTextTheme();
    }

    if (_previousBrightness != theme.brightness) {
      _previousBrightness = theme.brightness;
      _appThemeData = AppThemeData(
        flutterTheme: theme,
        colorsScheme: colorsScheme,
        textTheme: textTheme,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(_appThemeData, widget.child);
  }
}

class _InheritedAppTheme extends InheritedWidget {
  final AppThemeData data;

  const _InheritedAppTheme(this.data, Widget child) : super(child: child);

  @override
  bool updateShouldNotify(_InheritedAppTheme old) => old.data != data;
}

class AppThemeData {
  final ThemeData flutterTheme;
  final AppTextTheme textTheme;
  final AppColorsScheme colorsScheme;

  const AppThemeData({
    required this.flutterTheme,
    required this.textTheme,
    required this.colorsScheme,
  });

  factory AppThemeData.fallback() {
    final theme = ThemeData.fallback();
    final AppColorsScheme colorsScheme;
    final AppTextTheme textTheme;

    switch (theme.brightness) {
      case Brightness.dark:
      case Brightness.light:
        colorsScheme = const LightAppColorsScheme();
        textTheme = const LightAppTextTheme();
    }

    return AppThemeData(
      flutterTheme: theme,
      colorsScheme: colorsScheme,
      textTheme: textTheme,
    );
  }
}
