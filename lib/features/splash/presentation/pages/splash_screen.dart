import 'package:astrology/core/app_assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Image.asset(
      AppAssets.bgImg,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    )));
  }
}
