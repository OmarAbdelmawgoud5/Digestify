import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:news_app/Controllers/theme_controller.dart';
import 'package:news_app/pages/auth_page.dart';

import 'package:news_app/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  Get.put(SettingsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  Future<bool> firstTimeusingApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final firstTime = prefs.getBool("firstTime") ?? true;
    if (firstTime == true) {
      await prefs.setBool("firstTime", false);
    }
    return firstTime;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return GetMaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: controller.getThemeMode(),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: firstTimeusingApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data == true) {
              return const WelcomePage();
            } else {
              return const AuthPage();
            }
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}
