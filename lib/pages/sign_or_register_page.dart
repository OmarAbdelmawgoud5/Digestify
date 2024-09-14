import 'package:flutter/material.dart';
import 'package:news_app/pages/sign_in_page.dart';
import 'package:news_app/pages/sign_up_page.dart';

class SignOrRegisterPage extends StatefulWidget {
  const SignOrRegisterPage({super.key});

  @override
  State<SignOrRegisterPage> createState() => _SignOrRegisterPageState();
}

class _SignOrRegisterPageState extends State<SignOrRegisterPage> {
  bool showSignInPage = true;
  togglePages() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignInPage(ontap: togglePages,);
    } else {
      return SignUpPage(ontap: togglePages,);
    }
  }
}
