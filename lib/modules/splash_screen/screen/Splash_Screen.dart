import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_moon/common_constants/Color_CommonConstants.dart';
import 'package:flutter_moon/config/app_routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Timer(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
    Future.delayed(Duration(seconds: 3),(){
      Get.offAndToNamed(AppRoutes.HOME_SCREEN);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: ColorCommonConstants.BLUEGREYCOLOR,
          child: const Text(
            'FM',
            style: TextStyle(fontSize: 80.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
