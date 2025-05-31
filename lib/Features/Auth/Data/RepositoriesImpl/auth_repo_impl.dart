import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:snacky/Core/Errors/exceptions.dart';
import 'package:snacky/Core/Errors/failure.dart';
import 'package:snacky/Features/Auth/Data/Data_source/supabase_auth_service.dart';
import 'package:snacky/Features/Auth/Data/Models/supabase_user_model.dart';
import 'package:snacky/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:snacky/Features/Auth/Domain/Repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  // final FirebaseAuthServices firebaseAuthServices;
  final SupabaseAuthService supabaseAuthService;

  AuthRepoImpl({required this.supabaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      var user = await supabaseAuthService.createWithEmailAndPassword(
        name: name.trim(),
        email: email.trim(),
        password: password.trim(),
      );

      return right(SupabaseUserModel.fromSupabaseUser(user!));
    } on MyException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure("There was an error signing in $e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await supabaseAuthService.signIn(
        email: email,
        password: password,
      );
      return right(SupabaseUserModel.fromSupabaseUser(user!));
    } on MyException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      log(e.toString());
      return left(ServerFailure("There was an error signing in $e"));
    }
  }

  @override
  Future<void> signOut() async {
    await supabaseAuthService.signOut();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await supabaseAuthService.signInWithGoogle();
      return right(SupabaseUserModel.fromSupabaseUser(user.user!));
    } on MyException catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      log("there is an error $e");
      return left(ServerFailure("there an error try again later"));
    }
  }
}
