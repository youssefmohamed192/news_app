import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/splash/splash.dart';
import 'package:news_app/ui/screens/home_screen.dart';
import 'package:news_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        SplashScreen.routeName : (_) => SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}