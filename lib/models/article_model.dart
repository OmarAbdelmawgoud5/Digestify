import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  final String? image;
  final String title;
  final String subtitle;
  final String htmlText;
  final String? sectionName;
  final String sectionId;
  final String? publishDate;
  final String articleUrl;
  final String articleLink;
  final List<Tag> tags;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.htmlText,
    required this.sectionName,
    required this.sectionId,
    required this.publishDate,
    required this.articleUrl,
    required this.tags,
    required this.articleLink,
  });
  Map<String, dynamic> toMap() {
    return {
      "image": image!,
      "title": title,
      "subtitle": subtitle,
      "htmlText": htmlText,
      "sectionName": sectionName!,
      "sectionId": sectionId,
      "publishDate": publishDate!,
      "articleUrl": articleUrl,
      "articleLink": articleLink,
      "tags": Map<String, String>.fromEntries(
          tags.map((tag) => MapEntry(tag.tagName, tag.tagId))),
      "timestamp": FieldValue.serverTimestamp(),
    };
  }
}

class Tag {
  final String tagName;
  final String tagId;

  Tag({required this.tagName, required this.tagId});
}
