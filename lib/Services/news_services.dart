import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final Dio dio = Dio();
  final String url;
  final String resultSyntax;
  NewsServices({required this.url, required this.resultSyntax});
  Future<List<ArticleModel>?> getNews() async {
    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> recResponse = response.data;
        Map<String, dynamic> jsonData = recResponse["response"];
        List<dynamic> articles = jsonData[resultSyntax];
        List<ArticleModel> articleData = [];

        for (var element in articles) {
          if (element.containsKey("elements") &&
              element["elements"].isNotEmpty) {
            List<dynamic> assets = element["elements"][0]["assets"];
            if (assets.isEmpty) {
              continue;
            }
            assets.sort((a, b) => int.parse(b["typeData"]["width"])
                .compareTo(int.parse(a["typeData"]["width"])));
            String highestQualityImage = assets[0]["file"];
            List<Tag> tagsNameandId = [];
            List<dynamic> articleTagData = element["tags"];
            for (var tag in articleTagData) {
              tagsNameandId.add(Tag(tagId: tag["id"], tagName: tag["webTitle"]));
            }

            articleData.add(
              ArticleModel(
                image: highestQualityImage,
                title: element["webTitle"],
                subtitle: element["fields"]["trailText"],
                htmlText: element["fields"]["body"],
                sectionName: element["sectionName"],
                sectionId: element["sectionId"],
                publishDate: element["webPublicationDate"],
                articleLink: element["webUrl"],
                articleUrl: base64Url.encode(utf8.encode(element["webUrl"])),
                tags: tagsNameandId,
              ),
            );
          }
        }
        return articleData;
      }
    } on DioException  {
      rethrow;
    }
  }
}
