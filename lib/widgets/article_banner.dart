import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:news_app/Services/publish_time.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/icon_blur.dart';
import 'package:news_app/widgets/image_display_widget.dart';
import 'package:news_app/widgets/saved_bookmark_button.dart';
import 'package:news_app/widgets/section_button_list.dart';
import 'package:share_plus/share_plus.dart';

class ArticleBanner extends StatelessWidget {
  const ArticleBanner({
    super.key,
    required this.articledata,
    required this.height,
    required this.articleReadermode,
    this.onpressed,
    required this.buttonOnPressed,
  });

  final ArticleModel articledata;
  final double height;
  final bool articleReadermode;
  final VoidCallback? onpressed;
  final VoidCallback buttonOnPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: articleReadermode ? () {} : onpressed,
      child: Stack(
        children: [
          SizedBox(
            child: ImageDisplayWidget(article: articledata, height: height),
          ),
          Container(
            width: double.infinity,
            height: height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xCC000000),
                  Color(0x00000000),
                  Color(0x00000000),
                  Color(0xCC000000),
                  Color(0xCC000000),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: articleReadermode ? 35 : 10,
                  ),
                  if (articleReadermode)
                    Row(
                      children: [
                        IconBlur(
                          icon: Icons.arrow_back_ios,
                          paddingFromLeft: 3,
                          onpressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Spacer(
                          flex: 20,
                        ),
                        SavedBookmarkButton(articledata: articledata),
                        const SizedBox(
                          width: 8,
                        ),
                        IconBlur(
                            icon: Icons.share,
                            paddingFromLeft: 0,
                            onpressed: () {
                              Share.share(
                                  'Check out this article: ${articledata.articleLink}');
                            }),
                      ],
                    ),
                  //Spacer(flex: 1),
                  if (articleReadermode)
                    const Spacer(
                      flex: 4,
                    ),
                  SectionButtonWidget(
                    articleReadermode: articleReadermode,
                    articledata: articledata,
                    onpressed: buttonOnPressed,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (!articleReadermode) const Spacer(flex: 5),
                  AutoSizeText(
                    articledata.title,
                    maxLines: articleReadermode ? 3 : 2,
                    maxFontSize: articleReadermode ? 25 : 20,
                    style: TextStyle(
                        fontFamily: "meta",
                        height: 1,
                        fontWeight: FontWeight.w400,
                        fontSize: articleReadermode ? 25 : 20,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(
                    height: articleReadermode ? 10 : 5,
                  ),
                  Text(
                    PublishTime(date: articledata.publishDate!).timeAgo(),
                    style: TextStyle(
                        fontSize: articleReadermode ? 15 : 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
