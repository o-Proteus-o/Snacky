import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:snacky/Core/Errors/exceptions.dart';
import 'package:snacky/Shared/Dialog/feedback.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<User?> createWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        data: {'full_name': name.trim()},
        email: email.trim(),
        password: password.trim(),
      );
      return response.user!;
    } on AuthApiException catch (e) {
      log('Supabase API Error: ${e.message}');
      throw MyException('Supabase API Error: ${e.message}');
    } on AuthRetryableFetchException catch (e) {
      if (e.code == "") {
        FeedbackService.showError("message");
      }
      if (e.code == "") {
        FeedbackService.showError("message");
      }
      log('Network Error: ${e.message}');
      throw MyException('Network Error: ${e.message}');
    } catch (e) {
      log('Unexpected error: $e');
      throw MyException('Unexpected error: $e');
    }
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return response.user!;
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  String? get currentUserId {
    final user = _client.auth.currentUser;
    return user?.email;
  }

  Future<AuthResponse> signInWithGoogle() async {
    const webClientId =
        '440187533041-r9l6khqoea6kigvm4nmmjq6ogrq2bm6v.apps.googleusercontent.com';

    const iosClientId =
        '440187533041-9njejcnq4ep0h5l4mfgea87126eej73m.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return _client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
