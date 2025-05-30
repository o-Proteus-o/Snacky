import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<User?> createWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  }) async {
    final response = await _client.auth.signUp(
      email: email.trim(),
      password: password,
      data: {'name': name},
    );
    return response.user!;
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
