import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snacky/Core/Controllers/sign_pages_controller.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';
import 'package:snacky/Features/Auth/Presentation/Manager/register_cubit/register_cubit.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignIn/login_screen.dart';
import 'package:snacky/Shared/Widgets/custom_button.dart';
import 'package:snacky/Shared/Widgets/custom_password_field.dart';
import 'package:snacky/Shared/Widgets/custom_text_form_filed.dart';
import 'package:snacky/Shared/Widgets/divider_row.dart';
import 'package:snacky/Shared/Widgets/or_sign.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final opacity = Get.put(SignPagesController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late String name, email, password;

  Widget _buildNameField() => FadeTransition(
    opacity: opacity.fadeAnimations[1],
    child: CustomTextFormField(
      controller: nameController,
      onSaved: (val) => name = val!,
      labelText: "Name",
    ),
  );

  Widget _buildEmailField() => FadeTransition(
    opacity: opacity.fadeAnimations[1],
    child: CustomTextFormField(
      controller: emailController,
      onSaved: (val) => email = val!,
      labelText: "Email",
      validator: (val) {
        if (val == null || val.trim().isEmpty) {
          return 'Email is required';
        }
        if (!val.contains('@') || !val.contains('.')) {
          return 'Enter a valid email address';
        }
        return null;
      },
    ),
  );

  Widget _buildPasswordField() => FadeTransition(
    opacity: opacity.fadeAnimations[1],
    child: CustomPasswordField(
      onSaved: (val) => password = val ?? '',
      passwordController: passwordController,
      validator: (val) {
        if (val == null || val.trim().isEmpty || val.trim().length < 6) {
          return "Password is required";
        }
        if (val.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
      hintText: "Password",
      labelText: "Password",
    ),
  );

  Widget _buildRegisterButton() => CustomButton(
    text: "Sign Up",
    opacity: opacity.fadeAnimations[2],
    onClick: () {
      if (formKey.currentState!.validate()) {
        // formKey.currentState!.save();
        context.read<RegisterCubit>().signUpWithEmailAndPassword(
          nameUser: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } else {
        setState(() {
          autovalidateMode = AutovalidateMode.always;
        });
      }
    },
  );

  Widget _buildOrSign() => FadeTransition(
    opacity: opacity.fadeAnimations[3],
    child: OrSign(
      orSignText: "Already have an account? ",
      signText: "Login",
      onTap: () => Get.off(() => const LoginScreen()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: opacity.slideAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 200),
                FadeTransition(
                  opacity: opacity.fadeAnimations[0],
                  child: Text(
                    "Register",
                    style: AppTypography.font30BoldTitled.copyWith(
                      color: AppColors.primary500,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                _buildNameField(),
                const SizedBox(height: 20),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 80),
                _buildRegisterButton(),
                const SizedBox(height: 20),
                FadeTransition(
                  opacity: opacity.fadeAnimations[3],
                  child: DividerRow(text: "Or Sign UP With"),
                ),
                const SizedBox(height: 20),
                // FadeTransition(
                //   opacity: opacity.fadeAnimations[2],
                //   child: GoogleAndFacebookSign(),
                // ),
                const SizedBox(height: 20),
                _buildOrSign(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
