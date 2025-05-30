// import 'dart:developer';

// import 'package:snacky/Core/Errors/exceptions.dart';

// class FirebaseAuthServices {
//   // FirebaseAuth instance
//   Future<User> createWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final trimmedEmail = email.trim();
//       if (trimmedEmail.isEmpty ||
//           !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(trimmedEmail)) {
//         throw MyExeption('Please enter a valid email address.');
//       }
//       final credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//             email: trimmedEmail,
//             password: password,
//           );
//       return credential.user!;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         log(e.code);
//         throw MyExeption('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         log(e.code);
//         throw MyExeption('The account already exists for that email.');
//       } else if (e.code == 'invalid-email') {
//         log(e.code);
//         throw MyExeption('Please enter a valid email address.');
//       }
//       log(e.code);
//       throw MyExeption('There was an error creating the account: ${e.message}');
//     } catch (e) {
//       log(e.toString());
//       throw MyExeption('There was an error creating the account: $e');
//     }
//   }

//   Future<User> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final trimmedEmail = email.trim();
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: trimmedEmail,
//         password: password,
//       );
//       return credential.user!;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         log(e.code);
//         throw MyExeption('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         log(e.code);
//         throw MyExeption('Wrong password provided for that user.');
//       } else if (e.code == 'invalid-email') {
//         log(e.code);
//         throw MyExeption('Please enter a valid email address.');
//       }
//       log(e.code);
//       throw MyExeption('Authentication failed: ${e.message}');
//     } catch (e) {
//       throw MyExeption('An unknown error occurred: $e');
//     }
//   }

//   Future<void> signOut() async {
//     await FirebaseAuth.instance.signOut();
//   }

//   // Future<UserCredential> signInWithGoogle() async {
//   //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   //   final GoogleSignInAuthentication? googleAuth =
//   //       await googleUser?.authentication;

//   //   final credential = GoogleAuthProvider.credential(
//   //     accessToken: googleAuth?.accessToken,
//   //     idToken: googleAuth?.idToken,
//   //   );

//   //   return await FirebaseAuth.instance.signInWithCredential(credential);
//   // }
// }
