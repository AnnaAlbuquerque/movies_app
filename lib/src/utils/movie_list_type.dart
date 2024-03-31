enum MovieListType {
  upComing,
  topRated,
  none,
}

extension StringExtension on String {
  MovieListType parseMovieListType() => switch (this) {
        'Up coming' => MovieListType.upComing,
        'Top Rated' => MovieListType.topRated,
        _ => MovieListType.none
      };
}
