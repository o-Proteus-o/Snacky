import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:snacky/Features/Auth/Domain/Repositories/auth_repo.dart';
import 'package:snacky/Features/Auth/Presentation/Manager/sign_in_cubit/signin_cubit.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignIn/widgets/sign_in_bloc_consumer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String login = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(GetIt.I<AuthRepo>()),
      child: Scaffold(body: SignInBlocConsumer()),
    );
  }
}
