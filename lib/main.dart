import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/app_theme.dart';
import 'config/theme/themes.dart';
import 'core/di/app_locator.dart';
import 'core/di/bloc_scope.dart';
import 'presentation/screens/home_page.dart';
import 'presentation/screens/splash/bloc/splash_bloc.dart';
import 'presentation/screens/splash/splash_screen.dart';

GlobalKey<NavigatorState> globalKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLocator.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: globalKey,
        theme: Themes.lightTheme,
        builder: (ctx, child) {
          return AppThemeWidget(child: child!);
        },
        home: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return state is ShowSplashState
                ? const SplashScreen()
                : const HomePage();
          },
        ),
      ),
    );
  }
}
