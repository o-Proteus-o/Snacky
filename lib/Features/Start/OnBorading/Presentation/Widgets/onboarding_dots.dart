import 'package:flutter/material.dart';

class OnBoardingDots extends StatelessWidget {
  const OnBoardingDots({
    super.key,
    required this.onboardingData,
    required this.currentPage,
    required this.opacity,
  });

  final List<Map<String, dynamic>> onboardingData;
  final int currentPage;
  final Animation<double> opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      left: 40,
      right: 40,
      child: FadeTransition(
        opacity: opacity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboardingData.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color:
                    currentPage == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
