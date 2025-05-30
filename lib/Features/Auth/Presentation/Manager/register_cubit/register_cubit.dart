import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snacky/Features/Auth/Data/Models/supabase_user_model.dart';
import 'package:snacky/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:snacky/Features/Auth/Domain/Repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  // RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;
  StreamSubscription<AuthState>? _authSubscription;

  RegisterCubit(this.authRepo) : super(RegisterInitial()) {
    // Listen to auth state changes from Supabase
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      final session = data.session;
      if (session != null) {
        final userEntity = SupabaseUserModel.fromSupabaseUser(session.user);
        emit(RegisterSuccess(userEntity));
      } else {
        emit(RegisterFailed("You Can't Sign Up"));
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }

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
