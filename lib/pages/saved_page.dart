
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_app/Controllers/saved_articles_controller.dart';

import 'package:news_app/widgets/news_tile_list_view.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SavedArticlesController>();

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
                padding:  EdgeInsets.only(top: 12, bottom: 10),
                child: Text(
                  "Saved",
                  style: TextStyle(
                    fontFamily: "sf",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          Obx(() {
            if (controller.savedArticles.isNotEmpty) {
              return NewsTileListView(articles: controller.savedArticles);
            } else if (controller.isLoading.value) {
              return const SliverFillRemaining(
                child: CircularProgressIndicator(),
              );
            }else if (controller.errorMessage.isNotEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "An error happened\nPlease try again later",
                      style: TextStyle(fontFamily: "sf", fontSize: 25),
                    ),
                  ),
                );
              }
            else{return  const SliverFillRemaining(
                child: Center(
                  child: Text(
                    "No articles saved yet",
                    style: TextStyle(fontFamily: "sf", fontSize: 25),
                  ),
                ),
              );}
              
          })
        ],
      ),
    );
  }
}
// FutureBuilder(
//             future: getSavedArticles(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return SliverFillRemaining(
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 );
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return SliverFillRemaining(
//                   child: Center(
//                       child: Text(
//                     "No Saved Articles",
//                     style: TextStyle(fontFamily: "sf", fontSize: 25),
//                   )),
//                 );
//               } else if (snapshot.hasError) {
//                 return SliverFillRemaining(
//                   child: Center(
//                     child: Text(
//                       "An error happened\nPlease try again later",
//                       style: TextStyle(fontFamily: "sf", fontSize: 25),
//                     ),
//                   ),
//                 );
//               } else {
//                 return NewsTileListView(articles: snapshot.data!);
//               }
//             },
//           ),