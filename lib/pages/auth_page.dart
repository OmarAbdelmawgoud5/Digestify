import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:news_app/pages/main_screen.dart';

import 'package:news_app/pages/section_pref.dart';

import 'package:news_app/pages/sign_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  Future<bool> _isFirstTimeUser(String? uid) async {
    // final creationTime = user.metadata.creationTime;
    // final currentTime = DateTime.now();

    // if (creationTime != null) {
    //   final difference = currentTime.difference(creationTime).inMinutes;
    //   print(difference);
    //   return difference < 1;
    // }
    // return false;
    final doc = await FirebaseFirestore.instance
        .collection("userPrefSec")
        .doc(uid)
        .get();
    if (doc.exists) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final uid = FirebaseAuth.instance.currentUser!.uid;
          return FutureBuilder<bool>(
              future: _isFirstTimeUser(uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body:  Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasData && snapshot.data == true) {
                  return const SectionPref();
                } else {
                  return const MainScreen();
                }
              },
            );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: Image.asset("assets/Digestfy.png")),
          );
        } else
        { return  const SignOrRegisterPage();}
         
      },
    );
  }
}
