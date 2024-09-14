import 'package:flutter/material.dart';
import 'package:news_app/Services/news_services.dart';
import 'package:news_app/Services/url_to_get.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/fetch_news_failure_message.dart';
import 'package:news_app/widgets/news_tile_list_view.dart';
import 'package:flutter/src/widgets/sliver_fill.dart' as flutter_sliver;
import 'package:news_app/widgets/shimmer_sliver_list.dart';

class NewsTileListViewBuilder extends StatefulWidget {
  const NewsTileListViewBuilder(
      {super.key,
      this.section,
      this.tag,
      this.q,
      this.fromDate,
      this.toDate,
      this.orderBy,
      this.pageNumber=1});
  final String? section;
  final String? tag;
  final String? q;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? orderBy;
  final int pageNumber;

  @override
  State<NewsTileListViewBuilder> createState() =>
      _NewsTileListViewBuilderState();
}

class _NewsTileListViewBuilderState extends State<NewsTileListViewBuilder> {
  late Future<List<ArticleModel>?>? newsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNews();
  }

  void fetchNews() {
    setState(() {
      newsData = NewsServices(
              url: UrlToGet(
                      section: widget.section,
                      tag: widget.tag,
                      q: widget.q,
                      fromDate: widget.fromDate,
                      toDate: widget.toDate,
                      orderBy: widget.orderBy,
                      page: 1)
                  .buildSearchUrl(),
              resultSyntax: "results")
          .getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>?>(
      future: newsData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsTileListView(
            articles: snapshot.data ?? [],
          );
        } else if (snapshot.hasError) {
          return flutter_sliver.SliverFillRemaining(
              hasScrollBody: false,
              child: FetchNewsFailureMessage(
                retry: fetchNews,
              ));
        } else {
          return ShimmerSliverList();
        }
      },
    );
  }
}
