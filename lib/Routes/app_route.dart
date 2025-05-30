import 'package:flutter/material.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignIn/login_screen.dart';
import 'package:snacky/Features/Auth/Presentation/Screens/SignUp/register_Screen.dart';
import 'package:snacky/Features/Start/OnBorading/Presentation/onboarding_screen.dart';
import 'package:snacky/Features/Start/SplashScreen/Presentation/Screens/splash_screen.dart';
import 'package:snacky/Features/Start/UserRole/user_role_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashScreen.splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case OnBoradingScreen.onBoarding:
      return MaterialPageRoute(builder: (context) => const OnBoradingScreen());
    case LoginScreen.login:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case RegisterScreen.register:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case UserRoleScreen.userRole:
      return MaterialPageRoute(builder: (context) => const UserRoleScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
