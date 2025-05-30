import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:snacky/Shared/Widgets/custom_text_form_filed.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String? labelText;
  final TextEditingController passwordController;
  const CustomPasswordField({
    super.key,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.labelText,
    required this.passwordController,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.passwordController,
      labelText: widget.labelText,
      validator: widget.validator,
      hintText: widget.hintText,
      onSaved: widget.onSaved,
      obscureText: obsecure,
      suffixIcon: GestureDetector(
        onTap: () {
          obsecure = !obsecure;
          setState(() {});
        },
        child:
            obsecure
                ? const Icon(LucideIcons.eye)
                : const Icon(LucideIcons.eyeOff),
      ),
    );
  }
}
