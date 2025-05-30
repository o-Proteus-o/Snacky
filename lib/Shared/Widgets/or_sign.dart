import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';

class OrSign extends StatelessWidget {
  final String orSignText;
  final String signText;
  final void Function()? onTap;
  const OrSign({
    super.key,
    required this.orSignText,
    required this.signText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: orSignText,
            style: AppTypography.font16Regular.copyWith(
              color:
                  Theme.of(context).brightness == Brightness.light
                      ? AppColors.neutral500
                      : AppColors.neutral50,
            ),
          ),
          TextSpan(
            text: signText,
            style: AppTypography.font16Regular.copyWith(
              color: AppColors.primary500,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
