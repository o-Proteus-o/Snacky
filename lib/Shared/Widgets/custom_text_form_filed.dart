import 'package:flutter/material.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.obscureText = false,
    this.onSaved,
    this.hintText,
    this.validator,
    this.labelText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(
        fontSize: 18,
        color:
            Theme.of(context).brightness == Brightness.light
                ? AppColors.neutral500
                : AppColors.neutral50,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.primary500, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.primary500, width: 2),
        ),
      ),
    );
  }
}
