import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/theme_controller.dart';
import 'package:news_app/babstrap/iconstyle.dart';
import 'package:news_app/babstrap/settingGroup.dart';
import 'package:news_app/babstrap/settingItem.dart';

import 'package:news_app/pages/about_page.dart';
import 'package:news_app/pages/auth_page.dart';

import 'package:news_app/widgets/user_card.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const AuthPage());
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // User card
            UserCard(
              onTap: () {},
              cardColor: const Color.fromARGB(255, 56, 122, 59),
              userName:
                  FirebaseAuth.instance.currentUser!.displayName!.toUpperCase(),
              userProfilePic: const AssetImage("assets/noImage.png"),
              userMoreInfo: Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "sf",
                ),
              ),
            ),
            SettingsGroup(
              backgroundColor: Colors.transparent,
              items: [
                SettingsItem(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AboutPage();
                    }));
                  },
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about The Developer",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Dark mode',
                  trailing: StatefulBuilder(builder: (context, setState) {
                    return Switch.adaptive(
                      value: controller.isSavedDarkMode(),
                      onChanged: (value) {
                        setState(() {
                          controller.changeTheme();
                        });
                      },
                    );
                  }),
                ),
              ],
            ),

            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              backgroundColor: Colors.transparent,
              items: [
                SettingsItem(
                  onTap: signUserOut,
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
