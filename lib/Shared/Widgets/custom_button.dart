import 'package:flutter/material.dart';
import 'package:snacky/Core/Theme/app_theme.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onClick;
  final Animation<double> opacity;
  const CustomButton({
    super.key,
    required this.text,
    this.onClick,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppTheme.lightTheme.primaryColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
            child: Text(
              text,
              style: AppTypography.font18SemiBold.copyWith(
                color: AppColors.neutral50,
                // Theme.of(context).brightness == Brightness.light
                //     ? AppColors.neutral500
                //     : AppColors.neutral50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
