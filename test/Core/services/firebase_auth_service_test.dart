// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:snacky/Core/Errors/exceptions.dart';
// import 'package:snacky/Core/Services/firebase_auth_service.dart';
// import 'package:snacky/Core/Services/shred_pred_service.dart';

// void main() {
//   late FirebaseAuthServices authService;
//   late MockFirebaseAuth mockFirebaseAuth;

//   setUpAll(() async {
//     // If your SharedPrefsService has an init method, call it here
//     await SharedPrefsService.instance.init();
//   });
//   setUp(() {
//     mockFirebaseAuth = MockFirebaseAuth();
//     authService = FirebaseAuthServices();
//   });

//   test('createWithEmailAndPassword throws on invalid email', () async {
//     expect(
//       () => authService.createWithEmailAndPassword(
//         email: 'invalid',
//         password: 'password',
//       ),
//       throwsA(isA<MyExeption>()),
//     );
//   });

//   test('signInWithEmailAndPassword throws on user-not-found', () async {
//     // By default, MockFirebaseAuth throws user-not-found for unknown users
//     expect(
//       () => authService.signInWithEmailAndPassword(
//         email: 'nouser@email.com',
//         password: 'password',
//       ),
//       throwsA(isA<MyExeption>()),
//     );
//   });

//   test('signOut completes', () async {
//     await authService.signOut();
//     expect(mockFirebaseAuth.currentUser, isNull);
//   });
// }
