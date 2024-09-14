import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/saved_articles_controller.dart';
import 'package:news_app/models/article_model.dart';

class SavedBookmarkButton extends StatefulWidget {
  const SavedBookmarkButton({super.key, required this.articledata});
  final ArticleModel articledata;

  @override
  State<SavedBookmarkButton> createState() => _SavedBookmarkButtonState();
}

class _SavedBookmarkButtonState extends State<SavedBookmarkButton> {
  IconData icon = Icons.bookmark_outline_sharp;
  bool ispressed = false;
  final controller = Get.find<SavedArticlesController>();
  Future<bool> isArticleSaved(String articleId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance
        .collection("savedArticles")
        .doc(uid)
        .get();

    if (doc.exists && doc.data() != null) {
      return doc.data()!.containsKey(articleId);
    }
    return false;
  }

  void checkIfSaved() async {
    ispressed = controller.savedArticles
        .any((article) => article.articleUrl == widget.articledata.articleUrl);

    setState(() {
      if (ispressed) {
        icon = Icons.bookmark;
      } else {
        icon = Icons.bookmark_outline;
      }
    });
  }

  void addArticle() async {
    controller.addArticle(widget.articledata);
  }

  void removeArticle() async {
    controller.removeArticle(widget.articledata.articleUrl);
  }

  @override
  void initState() {
    
    super.initState();

    checkIfSaved();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () async {
              ispressed = !ispressed;
              setState(
                () {
                  if (ispressed) {
                    icon = Icons.bookmark;
                    addArticle();
                  } else {
                    icon = Icons.bookmark_outline;
                    removeArticle();
                  }
                },
              );
            },
            icon: Icon(
              size: 24,
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
