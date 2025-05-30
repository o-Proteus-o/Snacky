import 'package:dartz/dartz.dart';
import 'package:snacky/Core/Errors/failure.dart';
import 'package:snacky/Features/Auth/Domain/Entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signOut();
}
