import 'package:flutter/material.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';
import 'package:snacky/Shared/Widgets/animation_half_bw.dart';

class RoleWidget extends StatelessWidget {
  final String text;
  final void Function()? onRoleTaped;
  final AnimationController? animationContr;
  const RoleWidget({
    super.key,
    required this.text,
    this.onRoleTaped,
    this.animationContr,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationContr!,
      builder: (context, child) {
        return GestureDetector(
          onTap: onRoleTaped,
          child: AnimatedHalfBWBorder(
            progress: animationContr!.value,
            child: Container(
              width: 220,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  text,
                  style: AppTypography.font30BoldTitled.copyWith(
                    color:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
