import 'package:snacky/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUserModel extends UserEntity {
  SupabaseUserModel({required super.password, required super.email});

  factory SupabaseUserModel.fromSupabaseUser(User user) {
    return SupabaseUserModel(email: user.email ?? '', password: '');
  }
}
