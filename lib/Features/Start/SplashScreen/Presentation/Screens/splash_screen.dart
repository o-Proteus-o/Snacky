// lib/features/splash/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacky/Core/Controllers/splash_page_controller.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String splash = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary700,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Obx(() {
            final progress = controller.progress.value;
            // final opacity = (progress / 100).clamp(0.0, 1.0);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                ScaleTransition(
                  scale: controller.animation,
                  child: FadeTransition(
                    opacity: controller.animation,
                    child: Image.network(
                      'https://picsum.photos/200',
                      height: 120,
                    ),
                  ),
                ),
                const Spacer(),
                LinearProgressIndicator(
                  value: progress / 100,
                  backgroundColor: AppColors.neutral100,
                  color: Colors.white,
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(8),
                  stopIndicatorRadius: 0,
                ),
                Text(
                  "Version 1.0.0",
                  style: AppTypography.font12Medium.copyWith(
                    color: AppColors.neutral100,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Copyright © 2023 Snacky. All rights reserved.",
                  style: AppTypography.font12Medium.copyWith(
                    color: AppColors.neutral100,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
