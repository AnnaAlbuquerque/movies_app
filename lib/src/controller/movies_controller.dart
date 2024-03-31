import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies_app/src/model/genre_model.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/utils/request_utils.dart';

class MoviesController {
  List<MovieModel> decodeMovieList(Response response) {
    if (response.statusCode != 200) {
      throw Exception("Request Error");
    } else {
      final body = jsonDecode(response.body)['results'] as List;
      return body.map((movie) => MovieModel.fromMap(movie)).toList();
    }
  }

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(
      Uri.parse(
        RequestUtils.getFullURL('/movie/popular'),
      ),
    );

    return decodeMovieList(response);
  }

  Future<List<MovieModel>> getTopRatedMovies({int? page}) async {
    Map<String, dynamic> params = RequestUtils.getBaseParams();
    params.addAll(
      {
        'page': page?.toString() ?? '1',
      },
    );
    final response = await http.get(
      Uri.parse(
        RequestUtils.getFullURL('/movie/top_rated'),
      ).replace(queryParameters: params),
    );

    return decodeMovieList(response);
  }

  Future<List<MovieModel>> getUpComingMovies({int? page}) async {
    Map<String, dynamic> params = RequestUtils.getBaseParams();
    params.addAll(
      {
        'page': page?.toString() ?? '1',
      },
    );
    final response = await http.get(
      Uri.parse(
        RequestUtils.getFullURL('/movie/upcoming'),
      ).replace(queryParameters: params),
    );

    return decodeMovieList(response);
  }

  Future<List<MovieModel>> getMovieByName(String movieName) async {
    Map<String, dynamic> params = RequestUtils.getBaseParams();
    params.addAll({
      'query': movieName,
    });

    final response = await http.get(
      Uri.parse(
        RequestUtils.getFullURL('/search/movie'),
      ).replace(queryParameters: params),
    );

    return decodeMovieList(response);
  }

  Future<List<MovieModel>> getMovieByGenre({required int genreID, int? page}) async {
    Map<String, dynamic> params = RequestUtils.getBaseParams();
    params.addAll(
      {
        'with_genres': genreID.toString(),
        'page': page?.toString() ?? '1',
      },
    );

    final response = await http.get(
      Uri.parse(
        RequestUtils.getFullURL('/discover/movie'),
      ).replace(queryParameters: params),
    );

    return decodeMovieList(response);
  }

  Future<List<GenreModel>> getGenre() async {
    final response = await http.get(
      Uri.parse(
        RequestUtils.getFullURL('/genre/movie/list'),
      ),
    );
    if (response.statusCode != 200) {
      throw Exception("Request Error");
    } else {
      final body = jsonDecode(response.body)['genres'] as List;
      return body.map((genre) => GenreModel.fromMap(genre)).toList();
    }
  }
}
