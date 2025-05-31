import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacky/Core/Services/shred_pred_service.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignIn/login_screen.dart';
import 'package:snacky/Features/Start/OnBorading/Presentation/onboarding_screen.dart';
import 'package:snacky/Features/Start/UserRole/user_role_screen.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  RxDouble progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );

    animationController.forward();

    simulateLoading();
  }

  void simulateLoading() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 30));
      progress.value = i.toDouble();
    }
    final isOnboardingShown = SharedPrefsService.instance.isOnBoarding;
    if (isOnboardingShown) {
      await Future.delayed(const Duration(milliseconds: 500));
      Get.off(
        () => LoginScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      await Future.delayed(const Duration(milliseconds: 500));
      Get.off(
        () => OnBoradingScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500),
      );
    }
    final isAuthenticated = SharedPrefsService.instance.isAuth;
    if (isAuthenticated) {
      await Future.delayed(const Duration(milliseconds: 500));
      Get.off(
        () => UserRoleScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      await Future.delayed(const Duration(milliseconds: 500));
      Get.off(
        () => LoginScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
