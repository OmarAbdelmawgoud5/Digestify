

import 'package:flutter/material.dart';


import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/Catagory_page.dart';
import 'package:news_app/widgets/article_banner.dart';
import 'package:news_app/widgets/article_text_view.dart';
import 'package:news_app/widgets/divider_topics.dart';
import 'package:news_app/widgets/topics_button.dart';


class ArticleReaderPage extends StatelessWidget {
   ArticleReaderPage({super.key, required this.articledata});
  final ArticleModel articledata;
  late String text = articledata.htmlText
      .replaceAll(RegExp(r'<figure[^>]*>.*?<\/figure>', dotAll: true), '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                ArticleBanner(
                  articledata: articledata,
                  height: 500,
                  articleReadermode: true,
                  buttonOnPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Catagory(
                            catagoryName: articledata.sectionName!,
                            catagoryId: articledata.sectionId,
                            isSection: true);
                      },
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 470,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.0,color: Theme.of(context).scaffoldBackgroundColor ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ArticleText(text: text),
          ),
          const DividerTopics(),
          const DividerTopics(),
          const DividerTopics(),
          const DividerTopics(),
          const SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              child: Text(
                "Explore more on these topics",
                style: TextStyle(
                    color: Colors.grey, fontSize: 15, fontFamily: "sf"),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Wrap(
                spacing: 6,
                runSpacing: 8,
                children: articledata.tags.map(
                  (tag) {
                    return TopicsButton(
                      tag: tag,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Catagory(
                            catagoryName: tag.tagName,
                            catagoryId: tag.tagId,
                            isSection: false,
                          );
                        }),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          )
        ],
      ),
    );
  }
}
