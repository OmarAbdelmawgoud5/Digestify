import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/theme_controller.dart';

import 'package:news_app/Services/time_salut.dart';

import 'package:news_app/pages/search_page.dart';

import 'package:news_app/widgets/news_list_view_builder.dart';

import 'package:news_app/widgets/headlines_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contoller = Get.find<SettingsController>();
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(() {
              if (contoller.isdark.value) {
                return Center(
                  child: Image.asset(
                    "assets/digestify_dark.png",
                    height: 90,
                  ),
                );
              } else {
                return Center(
                  child: Image.asset(
                    "assets/Digestfy.png",
                    height: 90,
                  ),
                );
              }
            }),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${TimeBasedGreeting().getGreeting()}!",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: "meta",
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 55,
              decoration: BoxDecoration(
                color: const Color.fromARGB(92, 216, 217, 219),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                ),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Let's see what happened today",
                      style: TextStyle(
                        fontFamily: "sf",
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Headlines",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "sf",
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: CarouselWithFutureBuilder(
            packageName: "editorsPicks",
          )),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Trending Right Now",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "sf",
                ),
              ),
            ),
          ),
          const NewsTileListViewBuilder(),
        ],
      ),
    );
  }
}
