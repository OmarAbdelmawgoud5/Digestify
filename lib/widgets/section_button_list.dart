import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';


class SectionButtonWidget extends StatelessWidget {
  const SectionButtonWidget({
    super.key,
    required this.articledata,
    required this.onpressed,
    required this.articleReadermode,
  });

  final ArticleModel articledata;
  final VoidCallback onpressed;
  final bool articleReadermode;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 40, 148, 231),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        minimumSize: const Size(0, 0),
      ),
      onPressed: onpressed,
      child: Text(
        articledata.sectionName ?? "null",
        style: TextStyle(color: Colors.white, fontSize: articleReadermode ? 16 : 12),
      ),
    );
  }
}
