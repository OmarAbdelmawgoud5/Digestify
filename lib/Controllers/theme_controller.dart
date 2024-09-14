import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SettingsController extends GetxController {
  final box = GetStorage();
  var isdark = false.obs;

  @override
  void onInit() {
    super.onInit();
    isSavedDarkMode();
  }

  void saveThemeData(bool isDarkMode) {
    box.write("isDarkMode", isDarkMode);
    isdark.value = isDarkMode;
  }

  bool isSavedDarkMode() {
    isdark.value = box.read("isDarkMode") ?? false;
    return isdark.value;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
  }
}
