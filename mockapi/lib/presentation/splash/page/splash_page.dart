import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  static const routeName = '/splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
