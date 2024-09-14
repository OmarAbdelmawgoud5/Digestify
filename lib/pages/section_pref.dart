import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/section_model.dart';
import 'package:news_app/pages/main_screen.dart';
import 'package:news_app/widgets/introduction_button.dart';
import 'package:news_app/widgets/section_pref_button.dart';

class SectionPref extends StatefulWidget {
  const SectionPref({super.key});

  @override
  State<SectionPref> createState() => _SectionPrefState();
}

class _SectionPrefState extends State<SectionPref> {
  final Map<String, String> submittedPref = {};

  final List<SectionModel> sections = const [
    SectionModel(
      sectionId: "artanddesign",
      sectionName: "Art and design",
    ),
    SectionModel(
      sectionId: "books",
      sectionName: "Books",
    ),
    SectionModel(
      sectionId: "business",
      sectionName: "Business",
    ),
    SectionModel(
      sectionId: "cities",
      sectionName: "Cities",
    ),
    SectionModel(
      sectionId: "commentisfree",
      sectionName: "Opinion",
    ),
    SectionModel(
      sectionId: "community",
      sectionName: "Community",
    ),
    SectionModel(
      sectionId: "culture",
      sectionName: "Culture",
    ),
    SectionModel(
      sectionId: "education",
      sectionName: "Education",
    ),
    SectionModel(
      sectionId: "environment",
      sectionName: "Environment",
    ),
    SectionModel(
      sectionId: "fashion",
      sectionName: "Fashion",
    ),
    SectionModel(
      sectionId: "film",
      sectionName: "Film",
    ),
    SectionModel(
      sectionId: "food",
      sectionName: "Food",
    ),
    SectionModel(
      sectionId: "football",
      sectionName: "Football",
    ),
    SectionModel(
      sectionId: "games",
      sectionName: "Games",
    ),
    SectionModel(
      sectionId: "global-development",
      sectionName: "Global development",
    ),
    SectionModel(
      sectionId: "jobsadvice",
      sectionName: "Jobs",
    ),
    SectionModel(
      sectionId: "law",
      sectionName: "Law",
    ),
    SectionModel(
      sectionId: "lifeandstyle",
      sectionName: "Life and style",
    ),
    SectionModel(
      sectionId: "media",
      sectionName: "Media",
    ),
    SectionModel(
      sectionId: "money",
      sectionName: "Money",
    ),
    SectionModel(
      sectionId: "music",
      sectionName: "Music",
    ),
    SectionModel(
      sectionId: "politics",
      sectionName: "Politics",
    ),
    SectionModel(
      sectionId: "science",
      sectionName: "Science",
    ),
    SectionModel(
      sectionId: "society",
      sectionName: "Society",
    ),
    SectionModel(
      sectionId: "sport",
      sectionName: "Sport",
    ),
    SectionModel(
      sectionId: "stage",
      sectionName: "Stage",
    ),
    SectionModel(
      sectionId: "technology",
      sectionName: "Technology",
    ),
    SectionModel(
      sectionId: "travel",
      sectionName: "Travel",
    ),
    SectionModel(
      sectionId: "tv-and-radio",
      sectionName: "Television & radio",
    ),
  ];

  void uploadingSectiontoCloud() async {
    if (submittedPref.length < 5) {
      return;
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final docRef =
        FirebaseFirestore.instance.collection('userPrefSec').doc(userId);
    try {
      await docRef.set({"sections": submittedPref});
      Navigator.pop(context);
      Get.offAll(() => const MainScreen());
    } on Exception  {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Check your Internet Connection"),
        ),
      );
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
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text.rich(
                  TextSpan(
                    text: "Select Your Favorite ",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "sf",
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "News\n",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(text: "You Want To Show"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: Center(
                    child: Text(
                      "Please Choose At least 5 Sections",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  runSpacing: 12,
                  spacing: 8,
                  children: sections.map(
                    (section) {
                      return SectionPrefButton(
                        section: section,
                        prefmap: submittedPref,
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                IntroductionButton(
                    ontap: () {
                      uploadingSectiontoCloud();
                    },
                    text: "Finish")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
