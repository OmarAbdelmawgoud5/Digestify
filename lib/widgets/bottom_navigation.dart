import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.navigation,
  });
  final Function(dynamic) navigation;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3, right: 8, left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
            width: 1, color: const Color.fromARGB(88, 158, 158, 158)),
      ),
      child: GNav(
        onTabChange: (value) {
          navigation(value);
        },
        gap: 8,
        activeColor: Colors.white,
        color: Colors.grey,
        tabBackgroundColor: Colors.blue,
        padding: const EdgeInsets.all(8),
        iconSize: 30,
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: "Home",
          ),
          GButton(
            icon: Icons.explore,
            text: "Discover",
          ),
          GButton(
            icon: Icons.bookmark_border,
            text: "Saved",
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: "Settings",
          )
        ],
      ),
    );
  }
}
