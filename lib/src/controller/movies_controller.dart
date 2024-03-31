import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/src/model/genre_model.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/services/http_client.dart';
import 'package:movies_app/src/utils/request_utils.dart';

class MoviesController {
  final MovieHTTPClient client;

  MoviesController({
    required this.client,
  });

  List<MovieModel> decodeMovieList(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception("Request Error");
    } else {
      final body = jsonDecode(response.body)['results'] as List;
      print(body.map((movie) => MovieModel.fromMap(movie)).toList());
      return body.map((movie) => MovieModel.fromMap(movie)).toList();
    }
  }

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await client.get(url: '/movie/popular');
      return decodeMovieList(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getTopRatedMovies({int? page}) async {
    Map<String, dynamic> params = RequestUtils.getBaseParams();
    params.addAll(
      {
        'page': page?.toString() ?? '1',
      },
    );
    try {
      final response = await client.get(url: '/movie/top_rated', queryParams: params);

      return decodeMovieList(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getUpComingMovies({int? page}) async {
    //throw Exception("Request Error");
    Map<String, dynamic> params = RequestUtils.getBaseParams();
    params.addAll(
      {
        'page': page?.toString() ?? '1',
      },
    );
    try {
      final response = await client.get(url: '/movie/upcoming', queryParams: params);

      return decodeMovieList(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getMovieByName(String movieName) async {
    Map<String, dynamic> params = RequestUtils.getBaseParams();
    params.addAll({
      'query': movieName,
    });
    try {
      final response = await client.get(url: '/search/movie', queryParams: params);

      return decodeMovieList(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieModel>> getMovieByGenre({required int genreID, int? page}) async {
    Map<String, dynamic> params = RequestUtils.getBaseParams();
    params.addAll(
      {
        'with_genres': genreID.toString(),
        'page': page?.toString() ?? '1',
      },
    );
    try {
      final response = await client.get(url: '/discover/movie', queryParams: params);

      return decodeMovieList(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GenreModel>> getGenre() async {
    try {
      final response = await client.get(url: '/genre/movie/list');

      if (response.statusCode != 200) {
        throw Exception("Request Error");
      } else {
        final body = jsonDecode(response.body)['genres'] as List;
        return body.map((genre) => GenreModel.fromMap(genre)).toList();
      }
    } catch (e) {
      rethrow;
    }
  }
}
