import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static final SharedPrefsService _instance = SharedPrefsService._internal();
  late SharedPreferences _prefs;

  SharedPrefsService._internal();

  static SharedPrefsService get instance => _instance;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setDarkMode(bool isDark) async {
    await _prefs.setBool('isDarkMode', isDark);
  }

  bool get isDarkMode => _prefs.getBool('isDarkMode') ?? false;

  Future<void> setOnBoarding(bool isOnBoarding) async {
    await _prefs.setBool('isOnBoarding', isOnBoarding);
  }

  bool get isOnBoarding => _prefs.getBool('isOnBoarding') ?? false;

  Future<void> setAuth(bool isAuth) async {
    await _prefs.setBool('isAuth', isAuth);
  }

  bool get isAuth => _prefs.getBool('isAuth') ?? false;

  Future<void> setUserRole(String role) async {
    await _prefs.setString('userRole', role);
  }

  String get userRole => _prefs.getString('userRole') ?? 'customer';
}
