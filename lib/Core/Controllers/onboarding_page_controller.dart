import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late List<Animation<double>> fadeAnimations;
  final PageController pageController = PageController();

  final count = 6; // Number of widgets to animate

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    // Create fade animations with staggered intervals
    // fadeAnimations = List.generate(count, (index) {
    //   final start = index * 0.15;
    //   final end = start + 0.4;
    //   return CurvedAnimation(
    //     parent: animationController,
    //     curve: Interval(start, end, curve: Curves.easeIn),
    //   );
    // });
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
