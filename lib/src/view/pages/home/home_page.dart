import 'package:flutter/material.dart';
import 'package:movies_app/src/controller/movies_controller.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/utils/set_up.dart';
import 'package:movies_app/src/view/pages/home/widgets/movie_carousel_widget.dart';
import 'package:movies_app/src/view/pages/home/widgets/title_row_widget.dart';
import 'package:movies_app/src/view/pages/search/search_page.dart';
import 'package:movies_app/src/view/widgets/error_widget.dart';
import 'package:movies_app/src/view/widgets/loading_poster_widget.dart';
import 'package:movies_app/src/view/widgets/movie_item_widget.dart';

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
    popularMoviesList = getIt<MoviesController>().getPopularMovies();
    upComingMoviesList = getIt<MoviesController>().getUpComingMovies();
    topRatedMoviesList = getIt<MoviesController>().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Moovie",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<MovieModel>>(
                  future: popularMoviesList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return MovieErrorWidget(
                        onPressed: () {
                          setState(() {
                            popularMoviesList = getIt<MoviesController>().getPopularMovies();
                          });
                        },
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TitleRowBuild(
                                title: "Popular",
                                showMoreButton: false,
                                movieList: data,
                              ),
                            ],
                          ),
                          MovieCarouselWidget(
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
                          ),
                        ],
                      );
                    } else {
                      return MovieCarouselWidget(
                        itemCount: 3,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return const LoadingPosterWidget();
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 50),
                FutureBuilder<List<MovieModel>>(
                  future: upComingMoviesList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return MovieErrorWidget(
                        onPressed: () {
                          setState(() {
                            upComingMoviesList = getIt<MoviesController>().getUpComingMovies();
                          });
                        },
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return Column(
                        children: [
                          TitleRowBuild(
                            title: "Up coming",
                            movieList: data,
                          ),
                          MovieCarouselWidget(
                            itemCount: data.length,
                            itemBuilder: (context, itemIndex, pageViewIndex) {
                              return MovieItemWidget(
                                movie: data[itemIndex],
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      return MovieCarouselWidget(
                        itemCount: 3,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return const LoadingPosterWidget();
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 50),
                FutureBuilder<List<MovieModel>>(
                  future: topRatedMoviesList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return MovieErrorWidget(
                        onPressed: () {
                          setState(() {
                            topRatedMoviesList = getIt<MoviesController>().getTopRatedMovies();
                          });
                        },
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return Column(
                        children: [
                          TitleRowBuild(
                            title: "Top Rated",
                            movieList: data,
                          ),
                          MovieCarouselWidget(
                            itemCount: data.length,
                            itemBuilder: (context, itemIndex, pageViewIndex) {
                              return MovieItemWidget(
                                movie: data[itemIndex],
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      return MovieCarouselWidget(
                        itemCount: 3,
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return const LoadingPosterWidget();
                        },
                      );
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
