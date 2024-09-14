import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class ImageDisplayWidget extends StatelessWidget {
  ImageDisplayWidget({
    super.key,
    required this.article,
    required this.height,
    this.width,
  });

  final ArticleModel article;
  final double height;
  double? width;
  late Image noImage = Image.asset(
    "assets/NoImage.jpeg",
    fit: BoxFit.cover,
    height: height,
    width: double.infinity,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
      ),
      width: width ?? double.infinity,
      height: height,
      child: Image.network(
        loadingBuilder: (context, child, loadingProgress) =>
            (loadingProgress == null)
                ? child
                : const Center(child: CircularProgressIndicator()),
        errorBuilder: (context, error, stackTrace) => noImage,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        article.image ?? "assets/NoImage.jpeg",
      ),
    );
  }
}
