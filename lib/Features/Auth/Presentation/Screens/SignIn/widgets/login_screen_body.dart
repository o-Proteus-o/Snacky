import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as gip;
import 'package:snacky/Core/Controllers/onboarding_page_controller.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';
import 'package:snacky/Core/Utils/Constant/typography.dart';
import 'package:snacky/Features/Auth/Presentation/Manager/sign_in_cubit/signin_cubit.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignUp/register_Screen.dart';
import 'package:snacky/Shared/Widgets/custom_button.dart';
import 'package:snacky/Shared/Widgets/custom_password_field.dart';
import 'package:snacky/Shared/Widgets/custom_text_form_filed.dart';
import 'package:snacky/Shared/Widgets/divider_row.dart';
import 'package:snacky/Shared/Widgets/google_and_facebook_sign.dart';
import 'package:snacky/Shared/Widgets/or_sign.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final opacity = gip.Get.put(OnBoardingController());
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              FadeTransition(
                opacity: opacity.fadeAnimations[0],
                child: Text(
                  "Login",
                  style: AppTypography.font30BoldTitled.copyWith(
                    color: AppColors.primary500,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              FadeTransition(
                opacity: opacity.fadeAnimations[1],
                child: CustomTextFormField(
                  controller: emailController,
                  hintText: "Enter Your Email",
                  onSaved: (val) {
                    email = val!;
                  },
                ),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: opacity.fadeAnimations[2],
                child: CustomPasswordField(
                  passwordController: passwordController,
                  hintText: "Password",
                  onSaved: (val) {
                    password = val!;
                  },
                ),
              ),
              const SizedBox(height: 40),
              // Spacer(),
              const SizedBox(height: 40),
              CustomButton(
                text: "Sign In",
                opacity: opacity.fadeAnimations[3],
                onClick: () {
                  // formKey.currentState!.save();
                  if (formKey.currentState!.validate()) {
                    context.read<SigninCubit>().signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  } else {
                    AutovalidateMode.always;
                  }
                },
              ),
              SizedBox(height: 20),
              FadeTransition(
                opacity: opacity.fadeAnimations[4],
                child: DividerRow(text: " Or Sign In With "),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: opacity.fadeAnimations[4],
                child: GoogleAndFacebookSign(
                  onFacebookSign: () {},
                  onGoogleSign: () {
                    context.read<SigninCubit>().signInWithGoogle();
                  },
                ),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: opacity.fadeAnimations[3],
                child: OrSign(
                  orSignText: "Don't have an account? ",
                  signText: "Sign Up",
                  onTap: () {
                    () => gip.Get.off(
                      RegisterScreen(),
                      transition: gip.Transition.fade,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
