import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/controller/movies_controller.dart';
import 'package:movies_app/src/model/genre_model.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/services/movie_http_client.dart';

import '../../constants/test_constants.dart';
import '../mocks/test_mocks.mocks.dart';

void main() {
  late MoviesController controller;
  late MovieHTTPClient client;

  setUpAll(() {
    client = MockMovieHTTPClient();
    controller = MoviesController(client: client);
  });

  group('MoviesController - ', () {
    group('decodeMovieList - ', () {
      test('success', () {
        final movies = controller.decodeMovieList(TestConstants.movieResponseSuccess);

        expect(movies, isA<List<MovieModel>>());
        expect(movies, TestConstants.listMovies);
      });
      test('failure', () {
        expect(() => controller.decodeMovieList(TestConstants.movieResponseFailure),
            throwsA(isA<Exception>()));
      });
    });

    group('getPopularMovies - ', () {
      test('success', () async {
        when(client.get(url: '/movie/popular'))
            .thenAnswer((realInvocation) => TestConstants.futureMovieResponseSuccess);
        final response = await controller.getPopularMovies();

        expect(response, isA<List<MovieModel>>());
        expect(response, TestConstants.listMovies);
      });
      test('failure', () async {
        when(client.get(url: '/movie/popular'))
            .thenAnswer((realInvocation) => TestConstants.futureMovieResponseFailure);

        expect(controller.getPopularMovies(), throwsA(isA<Exception>()));
      });
    });

    group('getTopRatedMovies - ', () {
      test('success', () async {
        when(client.get(
          url: '/movie/top_rated',
          queryParams: {"api_key": "b562e21cb6c2c0481d4eee61f5dae6d1", 'page': "1"},
        )).thenAnswer((realInvocation) => TestConstants.futureMovieResponseSuccess);
        final response = await controller.getTopRatedMovies();

        expect(response, isA<List<MovieModel>>());
        expect(response, TestConstants.listMovies);
      });
      test('failure', () async {
        when(client.get(
          url: '/movie/top_rated',
          queryParams: {"api_key": "b562e21cb6c2c0481d4eee61f5dae6d1", 'page': "1"},
        )).thenAnswer((realInvocation) => TestConstants.futureMovieResponseFailure);

        expect(controller.getTopRatedMovies(), throwsA(isA<Exception>()));
      });
    });
    group('getUpComingMovies - ', () {
      test('success', () async {
        when(client.get(
          url: '/movie/upcoming',
          queryParams: {"api_key": "b562e21cb6c2c0481d4eee61f5dae6d1", 'page': "1"},
        )).thenAnswer((realInvocation) => TestConstants.futureMovieResponseSuccess);
        final response = await controller.getUpComingMovies();

        expect(response, isA<List<MovieModel>>());
        expect(response, TestConstants.listMovies);
      });
      test('failure', () async {
        when(client.get(
          url: '/movie/upcoming',
          queryParams: {"api_key": "b562e21cb6c2c0481d4eee61f5dae6d1", 'page': "1"},
        )).thenAnswer((realInvocation) => TestConstants.futureMovieResponseFailure);

        expect(controller.getUpComingMovies(), throwsA(isA<Exception>()));
      });
    });
    group('getMovieByName - ', () {
      test('success', () async {
        when(client.get(
          url: '/search/movie',
          queryParams: {
            "api_key": "b562e21cb6c2c0481d4eee61f5dae6d1",
            'query': 'movieName',
          },
        )).thenAnswer((realInvocation) => TestConstants.futureMovieResponseSuccess);
        final response = await controller.getMovieByName('movieName');

        expect(response, isA<List<MovieModel>>());
        expect(response, TestConstants.listMovies);
      });
      test('failure', () async {
        when(client.get(
          url: '/search/movie',
          queryParams: {
            "api_key": "b562e21cb6c2c0481d4eee61f5dae6d1",
            'query': 'movieName',
          },
        )).thenAnswer((realInvocation) => TestConstants.futureMovieResponseFailure);

        expect(controller.getMovieByName('movieName'), throwsA(isA<Exception>()));
      });
    });
    group('getMovieByGenre - ', () {
      test('success', () async {
        when(client.get(
          url: '/discover/movie',
          queryParams: {
            "api_key": "b562e21cb6c2c0481d4eee61f5dae6d1",
            'with_genres': '1',
            'page': '1',
          },
        )).thenAnswer((realInvocation) => TestConstants.futureMovieResponseSuccess);
        final response = await controller.getMovieByGenre(genreID: 1);

        expect(response, isA<List<MovieModel>>());
        expect(response, TestConstants.listMovies);
      });
      test('failure', () async {
        when(client.get(
          url: '/discover/movie',
          queryParams: {
            "api_key": "b562e21cb6c2c0481d4eee61f5dae6d1",
            'with_genres': '1',
            'page': '1',
          },
        )).thenAnswer((realInvocation) => TestConstants.futureMovieResponseFailure);

        expect(controller.getMovieByGenre(genreID: 1), throwsA(isA<Exception>()));
      });
    });

    group('getGenre - ', () {
      test('success', () async {
        when(client.get(
          url: '/genre/movie/list',
        )).thenAnswer((realInvocation) => TestConstants.futureGenreResponseSuccess);
        final response = await controller.getGenre();

        expect(response, isA<List<GenreModel>>());
        expect(response, TestConstants.listGenres);
      });
      test('failure', () async {
        when(client.get(
          url: '/genre/movie/list',
        )).thenAnswer((realInvocation) => TestConstants.futureGenreResponseFailure);

        expect(controller.getGenre(), throwsA(isA<Exception>()));
      });
    });
  });
}
