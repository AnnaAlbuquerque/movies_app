import 'package:movies_app/src/model/movie_model.dart';

class HomeModel {
  final List<MovieModel> popularMoviesList;
  final List<MovieModel> upComingMoviesList;
  final List<MovieModel> topRatedMoviesList;

  const HomeModel({
    required this.popularMoviesList,
    required this.upComingMoviesList,
    required this.topRatedMoviesList,
  });
}
