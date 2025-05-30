import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationContr;
  late AnimationController sellerController;
  late AnimationController driverController;
  late AnimationController customerController;

  @override
  void onInit() {
    super.onInit();
    animationContr = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    sellerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    driverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2900),
    );
    customerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Start each with a different delay
    sellerController.repeat();
    Future.delayed(
      const Duration(milliseconds: 400),
      () => driverController.repeat(),
    );
    Future.delayed(
      const Duration(milliseconds: 800),
      () => customerController.repeat(),
    );
  }

  @override
  void dispose() {
    sellerController.dispose();
    driverController.dispose();
    customerController.dispose();
    animationContr.dispose();
    super.dispose();
  }
}
