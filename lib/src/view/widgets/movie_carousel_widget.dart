import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieCarouselWidget extends StatelessWidget {
  final Size size;
  final bool autoPlay;
  final bool enlargeCenterPage;
  final Widget Function(BuildContext, int, int)? itemBuilder;
  final bool mainCarousel;

  const MovieCarouselWidget({
    super.key,
    required this.size,
    required this.itemBuilder,
    this.autoPlay = false,
    this.enlargeCenterPage = false,
    this.mainCarousel = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          height: mainCarousel ? size.height * 0.45 : size.height * 0.40,
          autoPlay: autoPlay,
          enlargeCenterPage: enlargeCenterPage,
          viewportFraction: 0.55,
          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
