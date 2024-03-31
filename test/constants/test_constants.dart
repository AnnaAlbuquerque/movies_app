import 'package:http/http.dart';
import 'package:movies_app/src/model/genre_model.dart';
import 'package:movies_app/src/model/movie_model.dart';

class TestConstants {
  static Response get movieResponseSuccess => Response(movieResponseBody, 200);
  static Future<Response> get futureMovieResponseSuccess => Future.value(movieResponseSuccess);

  static Response get movieResponseFailure => Response(movieResponseBody, 404);
  static Future<Response> get futureMovieResponseFailure => Future.value(movieResponseFailure);

  static String get movieResponseBody => r'''{
        "results": [
          {
            "backdrop_path": "backdrop",
            "original_language": "language",
            "overview":
                "overview",
            "popularity": 4595,
            "poster_path": "poster",
            "release_date": "date",
            "title": "title",
            "vote_average":5,
            "vote_count": 100
          }
        ]
      }''';

  static List<MovieModel> get listMovies => [
        const MovieModel(
          backdropPath: "backdrop",
          originalLanguage: "language",
          title: "title",
          overview: 'overview',
          poster: 'poster',
          releaseDate: 'date',
          voteAverage: 5,
          voteCount: 100,
          popularity: 4595,
        ),
      ];

  static Response get genreResponseSuccess => Response(genreResponseBody, 200);
  static Future<Response> get futureGenreResponseSuccess => Future.value(genreResponseSuccess);

  static Response get genreResponseFailure => Response(genreResponseBody, 404);
  static Future<Response> get futureGenreResponseFailure => Future.value(genreResponseFailure);

  static String get genreResponseBody => r'''{
        "genres": [
          {
            "id": 1,
            "name": "name"
          }
        ]
      }''';

  static List<GenreModel> get listGenres => [
        const GenreModel(
          genreName: 'name',
          id: 1,
        ),
      ];
}
