import 'package:flutter/material.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';

class DividerRow extends StatelessWidget {
  final String text;
  const DividerRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color:
                Theme.of(context).brightness == Brightness.light
                    ? AppColors.primary500
                    : AppColors.primary200,
            thickness: 1,
          ),
        ),
        Text(
          text,
          style: AppTypography.font16Regular.copyWith(
            color: AppColors.primary500,
          ),
        ),
        Expanded(
          child: Divider(
            color:
                Theme.of(context).brightness == Brightness.light
                    ? AppColors.primary500
                    : AppColors.primary200,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
