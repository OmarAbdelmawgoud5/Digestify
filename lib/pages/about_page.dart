
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture or avatar
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/my.jpeg'), // Add your profile picture here
                ),
              ),
              const SizedBox(height: 20),

              // Introduction
              const Text(
                "Hello, I'm Omar Abdelmawgoud",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "I'm a passionate Flutter developer from Egypt. I enjoy creating mobile applications that are intuitive, beautiful, and user-friendly.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Background
              const Text(
                "Background",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "With a background in software engineering, I have been developing mobile apps for a while. My journey began with Learing Languages like c, c++ and python and then DSA and has since grown to include a wide array of skills in Flutter, Dart, and more.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Motivation
              const Text(
                "What Drives Me",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "I'm driven by the desire to create impactful and innovative applications. My goal is to develop apps that not only solve problems but also bring joy and convenience to users.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Skills
              const Text(
                "Skills",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "• Flutter & Dart\n• Firebase\n• RESTful APIs\n• Problem Solving\n• OOP\n• DSA\n• Clean Code\n",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              const Text(
                "Get in Touch",
                style:  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.blue,
                ),
                onPressed: () {
                  launchUrl(Uri.parse("https://www.linkedin.com/in/omar-abdelmawgoud-270990302/"),);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
