import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:timer_app/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 150,
        splash: Lottie.asset('assets/9115-timer.json', fit: BoxFit.cover),
        centered: true,
        nextScreen: const HomeScreen(),
        backgroundColor: const Color.fromRGBO(27, 28, 31, 1),
      ),
    );
  }
}
