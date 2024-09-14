import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:news_app/models/section_model.dart';
import 'package:news_app/widgets/headlines_slider.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';
import 'package:news_app/widgets/section_toggle_button.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({super.key});

  Future<List<SectionModel>?> getSections() async {
    List<SectionModel>? sections;
    final uid = FirebaseAuth.instance.currentUser!.uid;
   
    await FirebaseFirestore.instance
        .collection("userPrefSec")
        .doc(uid)
        .get()
        .then((snapshot) {
     if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data();
      final sectionMap = Map<String, String>.from(data!['sections']); // Extract the sections map
      
      sections = sectionMap.entries.map((entry) {
        return SectionModel(
          sectionId: entry.value,   
          sectionName: entry.key,  
        );
      }).toList();
    }
    });

    return sections;
  }

  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding:  EdgeInsets.only(
                  left: 12,
                  top: 12,
                ),
                child: Text(
                  "Discover",
                  style: TextStyle(
                    fontFamily: "sf",
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12,
                  top: 1,
                ),
                child: Text(
                  "News from all around the world",
                  style: TextStyle(
                    fontFamily: "sf",
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 12, bottom: 10),
              child: Text(
                "Most Viewed",
                style: TextStyle(
                  fontFamily: "sf",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CarouselWithFutureBuilder(
              packageName: "mostViewed",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 12, bottom: 10),
              child: Text(
                "Your Picks",
                style: TextStyle(
                  fontFamily: "sf",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FutureBuilder<List<SectionModel>?>(
            future: getSections(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text("No sections available")),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: SectionToggleButtonList(
                      sectionList: snapshot.data,
                      selectedIndex: selectedIndex,
                    ),
                  ),
                );
              }
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          FutureBuilder<List<SectionModel>?>(
            future: getSections(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text("No sections available")),
                );
              } else {
                return ValueListenableBuilder<int>(
                  valueListenable: selectedIndex,
                  builder: (context, value, child) {
                    return NewsTileListViewBuilder(
                        key: ValueKey(snapshot.data![value]),
                        section: snapshot.data![value].sectionId);
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
