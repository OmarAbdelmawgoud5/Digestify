import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/models/article_model.dart';

class SavedArticlesController extends GetxController {
  var savedArticles = <ArticleModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    _loadSavedArticles();
  }

  Future<void> _loadSavedArticles() async {
    isLoading.value = true;
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      List<ArticleModel> articles = [];
      await FirebaseFirestore.instance
          .collection("savedArticles")
          .doc(uid)
          .get()
          .then(
        (snapshot) {
          if (snapshot.exists && snapshot.data() != null) {
            final data = snapshot.data();
            final orderedEntries = data!.entries.toList()
              ..sort((a, b) {
                return (b.value["timestamp"] as Timestamp)
                    .compareTo(a.value["timestamp"] as Timestamp);
              });

            articles = orderedEntries.map((entry) {
              final tagsData = entry.value["tags"];
              List<Tag> tags = [];

              // Safely handle tagsData as dynamic
              if (tagsData != null && tagsData is Map) {
                tags = tagsData.entries.map((tagEntry) {
                  return Tag(
                    tagName: tagEntry.key,
                    tagId: tagEntry.value.toString(),
                  );
                }).toList();
              }

              return ArticleModel(
                image: entry.value["image"],
                title: entry.value["title"],
                subtitle: entry.value["subtitle"],
                htmlText: entry.value["htmlText"],
                sectionName: entry.value["sectionName"],
                sectionId: entry.value["sectionId"],
                publishDate: entry.value["publishDate"],
                articleUrl: entry.value["articleUrl"],
                articleLink: entry.value["articleLink"],
                tags: tags,
              );
            }).toList();
          }
        },
      );
     
      savedArticles.addAll(articles);
    } on Exception catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addArticle(ArticleModel article) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection("savedArticles").doc(uid).set(
      {
        article.articleUrl: article.toMap(),
      },
      SetOptions(merge: true),
    );

    savedArticles.insert(0, article);
  }

  Future<void> removeArticle(String articleUrl) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("savedArticles")
        .doc(uid)
        .update({articleUrl: FieldValue.delete()});

    savedArticles.removeWhere((article) => article.articleUrl == articleUrl);
  }
}
