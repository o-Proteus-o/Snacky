import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignPagesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late List<Animation<double>> fadeAnimations;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    fadeAnimations = [
      CurvedAnimation(parent: animationController, curve: Interval(0.0, 0.2)),
      CurvedAnimation(parent: animationController, curve: Interval(0.2, 0.4)),
      CurvedAnimation(parent: animationController, curve: Interval(0.4, 0.6)),
      CurvedAnimation(parent: animationController, curve: Interval(0.6, 0.8)),
      CurvedAnimation(parent: animationController, curve: Interval(0.8, 1.0)),
    ];

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
