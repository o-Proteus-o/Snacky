import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'Roboto';

  static const TextStyle font12Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle font12Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  static const TextStyle font16Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle font16SemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static const TextStyle font16Light = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: fontFamily,
  );

  static const TextStyle font18Regular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle font18SemiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static const TextStyle font22Regular = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const TextStyle font22SemiBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static const TextStyle font22SemiBoldTitled = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    letterSpacing: 1.1, // 5%
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle font30BoldTitled = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    letterSpacing: 1.5, // 5%
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle font40SemiBold = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
}
