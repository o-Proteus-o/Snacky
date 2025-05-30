import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:snacky/Features/Auth/Domain/Repositories/auth_repo.dart';
import 'package:snacky/Features/Auth/Presentation/Manager/register_cubit/register_cubit.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignUp/widget/register_bloc_consumer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String register = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(GetIt.I<AuthRepo>()),
      child: Scaffold(body: RegisterBlocConsumer()),
    );
  }
}
