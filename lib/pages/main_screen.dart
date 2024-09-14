import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_app/Controllers/saved_articles_controller.dart';

import 'package:news_app/pages/settings_page.dart';
import 'package:news_app/pages/discover_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/saved_page.dart';
import 'package:news_app/widgets/bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    DiscoverPage(),
    const SavedPage(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(SavedArticlesController());
    return Scaffold(
      body: IndexedStack(
        index: activeIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigation(
        navigation: (index) {
          setState(
            () {
              activeIndex = index;
            },
          );
        },
      ),
    );
  }
}
