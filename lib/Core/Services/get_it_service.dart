import 'package:get_it/get_it.dart';
import 'package:snacky/Core/Services/supabase_auth_service.dart';
import 'package:snacky/Features/Auth/Data/RepositoriesImpl/auth_repo_impl.dart';
import 'package:snacky/Features/Auth/Domain/Repositories/auth_repo.dart';

void setup() {
  // GetIt.I.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  GetIt.I.registerSingleton<SupabaseAuthService>(SupabaseAuthService());
  GetIt.I.registerSingleton<AuthRepo>(
    AuthRepoImpl(supabaseAuthService: GetIt.I<SupabaseAuthService>()),
  );
}
