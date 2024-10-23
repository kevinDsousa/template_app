import 'package:diamond_blank_app/app/presenter/initial/splash/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final SplashController controller;

  const SplashPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
