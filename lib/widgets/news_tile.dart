
import 'package:flutter/material.dart';
import 'package:news_app/Services/publish_time.dart';

import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/article_reader_page.dart';

import 'package:news_app/widgets/image_display_widget.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      child: GestureDetector(
        onTap: () async {
          
          
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleReaderPage(articledata: article),
              ));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ImageDisplayWidget(
                article: article,
                height: 120,
                width: 130,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.sectionName!,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    article.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      fontFamily: "sf",
                    ),
                  ),
                  
                  Text(
                    PublishTime(date: article.publishDate!).timeAgo(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
