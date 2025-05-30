import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacky/Core/Services/get_it_service.dart';
import 'package:snacky/Core/Services/shred_pred_service.dart';
import 'package:snacky/Core/Theme/app_theme.dart';
import 'package:snacky/Features/Start/SplashScreen/Presentation/Screens/splash_screen.dart';
import 'package:snacky/Routes/app_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ruexyxjokrjesjuhwbhp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ1ZXh5eGpva3JqZXNqdWh3YmhwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg1OTM5ODEsImV4cCI6MjA2NDE2OTk4MX0.YUttaSsVCrIeoyHqmVrn099K017MoPTS0h_NZOuw9oc',
  );
  await SharedPrefsService.instance.init();
  setup();

  runApp(const Snacky());
}

class Snacky extends StatefulWidget {
  const Snacky({super.key});

  @override
  State<Snacky> createState() => _SnackyState();
}

class _SnackyState extends State<Snacky> {
  final isDark = SharedPrefsService.instance.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.splash,
    );
  }
}
