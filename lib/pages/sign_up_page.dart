import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:news_app/widgets/introduction_button.dart';

import 'package:news_app/widgets/user_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.ontap});
  final VoidCallback ontap;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool hasSignError = false;
  String errorMessege = "";
  @override
  void dispose() {
    
    super.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void signUserUp() async {
    setState(() {
      hasSignError = false;
    });
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty ||
        firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty) {
      setState(() {
        errorMessege = "Please fill all the fields";
        hasSignError = true;
      });
      return;
    }
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      setState(() {
        errorMessege = "Passwords Should Match";
        hasSignError = true;
      });
      return;
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      UserCredential usercredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
       Navigator.pop(context);

      await usercredential.user!.updateDisplayName(
          "${firstNameController.text.trim()} ${lastNameController.text.trim()}");
      
    } on FirebaseAuthException catch (e) {
     
      if (e.code == "invalid-email") {
        errorMessege = "Please enter a valid email";
      } else if (e.code == "weak-password") {
        errorMessege = "Your password is weak, change it to a stronger one";
      } else if (e.code == "email-already-in-use") {
        errorMessege = "Email already in use";
      } else {
        errorMessege = "Please check your Internet connection";
      }
      setState(() {
        hasSignError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text.rich(
                  TextSpan(
                    text: "Create Your ",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "sf",
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Digestify\n",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(text: "Account Now"),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                  child: hasSignError
                      ? Center(
                          child: Text(
                            errorMessege,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontFamily: "sf"),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                const Text(
                  "First Name",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "sf",
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextField(
                  hintText: "Your First Name",
                  obscure: false,
                  controller: firstNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Last Name",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "sf",
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextField(
                  hintText: "Your Last Name",
                  obscure: false,
                  controller: lastNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "sf",
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextField(
                  hintText: "Your Email",
                  obscure: false,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "sf",
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextField(
                  hintText: "Your Password",
                  obscure: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "sf",
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyTextField(
                  hintText: "Confirm Your Password",
                  obscure: true,
                  controller: confirmPasswordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                IntroductionButton(ontap: signUserUp, text: "Sign Up"),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: " Login",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontFamily: "sf",
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.ontap,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
