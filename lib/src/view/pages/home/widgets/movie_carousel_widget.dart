import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieCarouselWidget extends StatelessWidget {
  final int itemCount;
  final bool autoPlay;
  final bool enlargeCenterPage;
  final Widget Function(BuildContext, int, int) itemBuilder;
  final bool mainCarousel;

  const MovieCarouselWidget({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.autoPlay = false,
    this.enlargeCenterPage = false,
    this.mainCarousel = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: itemCount,
        options: CarouselOptions(
          height: mainCarousel ? size.height * 0.50 : size.height * 0.40,
          autoPlay: autoPlay,
          enlargeCenterPage: enlargeCenterPage,
          viewportFraction: 0.55,
          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enlargeFactor: 0.25,
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: itemBuilder(context, itemIndex, pageViewIndex),
          );
        },
      ),
    );
  }
}
