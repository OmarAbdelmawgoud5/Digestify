import 'package:flutter/material.dart';
import 'package:news_app/pages/main_screen.dart';
import 'package:news_app/pages/section_pref.dart';

class MainPrefToggle extends StatefulWidget {
  const MainPrefToggle({super.key});

  @override
  State<MainPrefToggle> createState() => _MainPrefToggleState();
}

class _MainPrefToggleState extends State<MainPrefToggle> {
  bool isPrefScreen = true;
  toggle() {
    setState(() {
      isPrefScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isPrefScreen) {
      return SectionPref();
    } else {
      return MainScreen();
    }
  }
}
