import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Services/auth_services.dart';

import 'package:news_app/widgets/introduction_button.dart';
import 'package:news_app/widgets/other_sign_buttons.dart';
import 'package:news_app/widgets/user_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hasSignError = false;
  String errorMessege = "";
  @override
  void dispose() {
    
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUserIn() async {
    setState(() {
      hasSignError = false;
    });
    if (emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      setState(() {
        errorMessege = "Please fill all the fields";
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
     
      if (e.code == "invalid-credential") {
        errorMessege =
            "The email or password that you have entered is incorrect";
      } else if (e.code == "invalid-email") {
        errorMessege = "Please enter a valid email";
      } else {
        errorMessege = "Please check your Internet connection";
      }
      setState(() {
        hasSignError = true;
      });
    }
  }

  @override
  void initState() {
    
    super.initState();
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
                    text: "Login to Your ",
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
                  height: MediaQuery.of(context).size.height * .1,
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
                  height: 30,
                ),
                IntroductionButton(ontap: signUserIn, text: "Login"),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        indent: 10,
                        endIndent: 7,
                      ),
                    ),
                    Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        indent: 7,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                OtherSignButtons(
                  text: "Google",
                  logoPath: "assets/google.webp",
                  ontap: AuthServices().signInWithGoogle,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Not a member?",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                            text: " Register now",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontFamily: "sf",
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.ontap)
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

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.easeInOutCubic;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }
