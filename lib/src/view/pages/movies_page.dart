import 'package:flutter/material.dart';
import 'package:movies_app/src/controller/movies_controller.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/view/widgets/movie_carousel_widget.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late Future<List<MovieModel>> moviesList;

  @override
  void initState() {
    super.initState();
    MoviesController().getMovieByGenre(genreID: 12);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MovieCarouselWidget(
                size: size,
                autoPlay: true,
                enlargeCenterPage: true,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Container(
                    height: 300,
                    width: 200,
                    color: Colors.red,
                  );
                },
              ),
              const SizedBox(height: 50),
              MovieCarouselWidget(
                size: size,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Container(
                    height: 300,
                    width: 200,
                    color: Colors.red,
                  );
                },
              ),
              const SizedBox(height: 50),
              MovieCarouselWidget(
                size: size,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Container(
                    height: 300,
                    width: 200,
                    color: Colors.red,
                  );
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
