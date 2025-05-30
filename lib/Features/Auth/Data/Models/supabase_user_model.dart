import 'package:snacky/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserModel extends UserEntity {
  SupabaseUserModel({required super.password, required super.email});

  factory SupabaseUserModel.fromSupabaseUser(AuthResponse response) {
    return SupabaseUserModel(
      email: response.user?.email ?? '',
      password: '', // Password is not returned by Supabase for security reasons
    );
  }
}
