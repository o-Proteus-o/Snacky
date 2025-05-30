import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snacky/Features/Auth/Presentation/Manager/register_cubit/register_cubit.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignUp/widget/register_screen_body.dart';
import 'package:snacky/Shared/Dialog/feedback.dart';

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          FeedbackService.showSuccess("Done!");
        } else {
          if (state is RegisterFailed) {
            FeedbackService.showError(state.error);
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading ? true : false,
          child: RegisterScreenBody(),
        );
      },
    );
  }
}
