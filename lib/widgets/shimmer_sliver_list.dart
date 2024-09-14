import 'package:flutter/material.dart';
import 'package:news_app/widgets/shimmer_news_tile.dart';

class ShimmerSliverList extends StatelessWidget {
  const ShimmerSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
      return const NewsTileShimmer();
    }));
  }
}
