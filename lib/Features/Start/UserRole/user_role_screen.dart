import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacky/Core/Controllers/app_theme_controller.dart';
import 'package:snacky/Core/Controllers/color_animation_controller.dart';
import 'package:snacky/Core/Controllers/onboarding_page_controller.dart';
import 'package:snacky/Core/Controllers/role_page_controller.dart';
import 'package:snacky/Core/Services/shred_pred_service.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';
import 'package:snacky/Shared/Widgets/animated_buttons.dart';

class UserRoleScreen extends StatefulWidget {
  const UserRoleScreen({super.key});
  static const String userRole = 'userRole';
  @override
  State<UserRoleScreen> createState() => _UserRoleScreenState();
}

class _UserRoleScreenState extends State<UserRoleScreen> {
  final controller = Get.put(OnBoardingController());
  final navigationController = Get.put(RolePageController());
  final animatedController = Get.put(ColorAnimationController());

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                SharedPrefsService.instance.isDarkMode;
                ThemeController().toggleTheme();
                setState(() {});
              },
              child:
                  Get.isDarkMode
                      ? const Icon(Icons.mode_night)
                      : Icon(Icons.sunny),
            ),
            Spacer(),
            Text(
              "Choose Your Role",
              style: AppTypography.font30BoldTitled.copyWith(
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            const SizedBox(height: 100),
            RoleWidget(
              animationContr: animatedController.sellerController,
              text: "Seller",
              onRoleTaped: () {
                navigationController.completeOnboarding("seller");
              },
            ),
            const SizedBox(height: 20),
            RoleWidget(
              animationContr: animatedController.driverController,
              text: "Driver",
              onRoleTaped: () {
                navigationController.completeOnboarding("driver");
              },
            ),
            const SizedBox(height: 20),
            RoleWidget(
              animationContr: animatedController.customerController,
              text: "Customer",
              onRoleTaped: () {
                navigationController.completeOnboarding("customer");
              },
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
