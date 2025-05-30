import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:snacky/Core/Controllers/app_theme_controller.dart';
import 'package:snacky/Core/Controllers/onboarding_page_controller.dart';
import 'package:snacky/Core/Services/shred_pred_service.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';
import 'package:snacky/Features/Start/OnBorading/Presentation/Widgets/onboarding_dots.dart';
import 'package:snacky/Shared/Widgets/custom_button.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});
  static const String onBoarding = 'onBoarding';

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  final controller = Get.put(OnBoardingController());
  int currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Welcome To Snacky",
      "image": "assets/images/trackorder.svg",
      "description":
          "Your favorite meals, snacks, and \ncravings delivered fast and fresh \nright from your phone.",
    },
    {
      "title": "Lightning-Fast Delivery",
      "image": "assets/images/trackorder.svg",
      "description":
          "We get it, you’re hungry. Our riders \nbring your food hot and on \ntime every single time.",
    },
    {
      "title": "Your Money Is Safe",
      "image": "",
      "description":
          "Pay with confidence. If your order doesn't arrive, \nyou get your money back guaranteed.",
    },
    {
      "title": "More Choices, More Cravings",
      "image": "assets/images/selection.svg",
      "description":
          "Pizzas, burgers, shawarma ... or anything \nyou love. Browse menus, mix items, \nand build your own meal.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FadeTransition(
            opacity: controller.fadeAnimations[0],
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    FadeTransition(
                      opacity: controller.fadeAnimations[index],
                      child: SvgPicture.asset(
                        onboardingData[index]['image'],
                        height: 300,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeTransition(
                      opacity: controller.fadeAnimations[index],
                      child: Text(
                        onboardingData[index]['title'] as String,
                        style: AppTypography.font22SemiBold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeTransition(
                      opacity: controller.fadeAnimations[index],
                      child: Text(
                        onboardingData[index]['description'] as String,
                        textAlign: TextAlign.center,
                        style: AppTypography.font18SemiBold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 40,
            child: FadeTransition(
              opacity: controller.fadeAnimations[1],
              child: GestureDetector(
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
            ),
          ),
          OnBoardingDots(
            opacity: controller.fadeAnimations[2],
            onboardingData: onboardingData,
            currentPage: currentPage,
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 70,
            child: CustomButton(
              opacity: controller.fadeAnimations[3],
              onClick: () async {
                await SharedPrefsService.instance.setOnBoarding(true);

                final isLastPage = currentPage == onboardingData.length - 1;
                if (isLastPage) {
                  Get.off(() => Scaffold(), transition: Transition.fadeIn);
                } else {
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              text:
                  currentPage == onboardingData.length - 1
                      ? "Start Enjoy"
                      : "Next",
            ),
          ),
        ],
      ),
    );
  }
}
