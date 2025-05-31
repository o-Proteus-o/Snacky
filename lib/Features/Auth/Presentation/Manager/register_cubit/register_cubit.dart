import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snacky/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:snacky/Features/Auth/Domain/Repositories/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> signUpWithEmailAndPassword({
    required String nameUser,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    final result = await authRepo.createWithEmailAndPassword(
      nameUser.trim(),
      email.trim(),
      password.trim(),
    );

    result.fold(
      (failure) => emit(RegisterFailed(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}
