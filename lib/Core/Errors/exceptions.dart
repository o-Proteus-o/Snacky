import 'package:firebase_auth/firebase_auth.dart';

class MyException implements Exception {
  final String message;
  MyException(this.message);
}

class FireException extends FirebaseAuthException {
  FireException({
    required super.code,
    super.message,
    super.email,
    super.credential,
    super.phoneNumber,
    StackTrace? stackTrace,
    super.tenantId,
  });
}
