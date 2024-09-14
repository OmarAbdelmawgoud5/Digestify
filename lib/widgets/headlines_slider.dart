import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/Services/news_services.dart';
import 'package:news_app/Services/url_to_get.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/Catagory_page.dart';
import 'package:news_app/pages/article_reader_page.dart';
import 'package:news_app/widgets/article_banner.dart';
import 'package:news_app/widgets/fetch_news_failure_message.dart';
import 'package:news_app/widgets/shimmer_carousal_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWithFutureBuilder extends StatefulWidget {
  const CarouselWithFutureBuilder({super.key, required this.packageName});
  final String packageName;
  @override
  _CarouselWithFutureBuilderState createState() =>
      _CarouselWithFutureBuilderState();
}

class _CarouselWithFutureBuilderState extends State<CarouselWithFutureBuilder> {
 late Future<List<ArticleModel>?> newsData;
  int activeIndex = 0;
  @override
  void initState() {
    
    super.initState();
    fetchHeadlineNews();
  }

  void fetchHeadlineNews() {
    setState(() {
      newsData = NewsServices(
              url: UrlToGet(page: 1).singleItemUrl, resultSyntax: widget.packageName)
          .getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<ArticleModel>?>(
      future: newsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: ShimmerCarousalSlider(),
          );
        } else if (snapshot.hasError) {
          return FetchNewsFailureMessage(retry: fetchHeadlineNews);
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No Headlines Available',
              style: TextStyle(fontSize: 30),
            ),
          );
        } else {
          while (snapshot.data!.length > 10) {
            snapshot.data!.removeLast();
          }
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: size.height * .25,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
                items: snapshot.data!.map(
                  (article) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ArticleBanner(
                            articledata: article,
                            height: size.height * .25,
                            articleReadermode: false,
                            buttonOnPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Catagory(
                                  catagoryName: article.sectionName!,
                                  catagoryId: article.sectionId,
                                  isSection: true);
                            })),
                            onpressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleReaderPage(
                                    articledata: article,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: snapshot.data!.length,
                effect: const JumpingDotEffect(
                  verticalOffset: 10,
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.blueAccent,
                  dotColor: Colors.grey,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
