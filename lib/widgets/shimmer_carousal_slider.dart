import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCarousalSlider extends StatelessWidget {
  const ShimmerCarousalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * .25,
        autoPlay: false,
        enlargeCenterPage: true,
      ),
      items: [1, 2, 3].map(
        (bulk) {
          return Builder(
            builder: (BuildContext context) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
