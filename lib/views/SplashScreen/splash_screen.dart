import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:masar_app/constant.dart';
import 'package:masar_app/views/Authentication/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 300,
      animationDuration: const Duration(seconds: 1),
      duration: Duration.millisecondsPerSecond,
      backgroundColor: kBackGroundColor,
      splashTransition: SplashTransition.fadeTransition,
      splash: Image.asset("assets/images/logo.png"),
      nextScreen: const LoginScreen());
  }
}