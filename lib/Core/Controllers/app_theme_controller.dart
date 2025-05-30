import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snacky/Core/Services/shred_pred_service.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = SharedPrefsService.instance.isDarkMode.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    SharedPrefsService.instance.setDarkMode(isDarkMode.value);
  }
}
