import 'package:flutter/material.dart';
import 'package:movies_app/src/controller/movies_controller.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/view/pages/home/widgets/movie_carousel_widget.dart';
import 'package:movies_app/src/view/pages/home/widgets/movie_item_widget.dart';
import 'package:movies_app/src/view/pages/home/widgets/title_row_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<MovieModel>> popularMoviesList;
  late Future<List<MovieModel>> upComingMoviesList;
  late Future<List<MovieModel>> topRatedMoviesList;

  @override
  void initState() {
    super.initState();
    popularMoviesList = MoviesController().getPopularMovies();
    upComingMoviesList = MoviesController().getUpComingMovies();
    topRatedMoviesList = MoviesController().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleRowBuild(
                  title: "Popular",
                  showMoreButton: false,
                ),
                FutureBuilder<List<MovieModel>>(
                  future: popularMoviesList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      //TODO: Add error
                      return Container();
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return MovieCarouselWidget(
                        itemCount: data.length,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        mainCarousel: true,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return MovieItemWidget(
                            movie: data[itemIndex],
                            showDetails: true,
                          );
                        },
                      );
                    } else {
                      //TODO: Add better loading
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: 50),
                const TitleRowBuild(
                  title: "Up coming",
                ),
                FutureBuilder<List<MovieModel>>(
                  future: upComingMoviesList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      //TODO: Add error
                      return Container();
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return MovieCarouselWidget(
                        itemCount: data.length,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return MovieItemWidget(
                            movie: data[itemIndex],
                          );
                        },
                      );
                    } else {
                      //TODO: Add better loading
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: 50),
                const TitleRowBuild(
                  title: "Top Rated",
                ),
                FutureBuilder<List<MovieModel>>(
                  future: topRatedMoviesList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      //TODO: Add error
                      return Container();
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return MovieCarouselWidget(
                        itemCount: data.length,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return MovieItemWidget(
                            movie: data[itemIndex],
                          );
                        },
                      );
                    } else {
                      //TODO: Add better loading
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
