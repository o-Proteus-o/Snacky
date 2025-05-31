import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as ge;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snacky/Core/Services/shred_pred_service.dart';
import 'package:snacky/Features/Auth/Presentation/Manager/sign_in_cubit/signin_cubit.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignIn/widgets/login_screen_body.dart';
import 'package:snacky/Features/Start/UserRole/user_role_screen.dart';
import 'package:snacky/Shared/Dialog/feedback.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          SharedPrefsService.instance.setAuth(true);
          FeedbackService.showSuccess("message");
          ge.Get.off(
            () => UserRoleScreen(),
            transition: ge.Transition.rightToLeft,
            duration: const Duration(milliseconds: 500),
          );
        } else {
          if (state is SigninFailed) {
            FeedbackService.showError(state.errorMessage);
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SigninLoading ? true : false,
          child: LoginScreenBody(),
        );
      },
    );
  }
}
