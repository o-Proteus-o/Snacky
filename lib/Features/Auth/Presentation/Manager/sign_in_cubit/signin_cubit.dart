import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snacky/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:snacky/Features/Auth/Domain/Repositories/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());

    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(SigninFailed(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SigninFailed(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }
}
