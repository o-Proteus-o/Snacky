import 'package:firebase_auth/firebase_auth.dart';

class MyExeption implements Exception {
  final String message;
  MyExeption(this.message);
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
