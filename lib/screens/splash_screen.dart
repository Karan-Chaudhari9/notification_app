import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/auth');
    });
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie_animation/Starting.json',
          height: 150,
          width: 250,
          frameRate: FrameRate(60),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
