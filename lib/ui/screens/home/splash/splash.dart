import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home_screen.dart';
import 'package:news_app/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 2),() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeScreen()));
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppAssets.splash),
    );
  }
}
