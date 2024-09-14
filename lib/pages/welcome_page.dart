import 'package:flutter/material.dart';
import 'package:news_app/pages/auth_page.dart';

import 'package:news_app/widgets/introduction_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/welcome.jpeg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text.rich(
                  TextSpan(
                    text: "Don't Miss What Happen in\n",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sf"),
                    children: [
                      TextSpan(
                        text: "Another",
                        style: TextStyle(
                            fontSize: 25,
                            backgroundColor: Colors.blue,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sf"),
                      ),
                      TextSpan(
                        text: " Part Of The ",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sf"),
                      ),
                      TextSpan(
                        text: "World",
                        style: TextStyle(
                            fontSize: 25,
                            backgroundColor: Colors.blue,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sf"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: IntroductionButton(
                      ontap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PopScope(
                            canPop: false,
                            child: AuthPage(),
                          );
                        }));
                      },
                      text: "Get Started"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
