import 'dart:developer';

import 'package:snacky/Core/Errors/exceptions.dart';
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
}
