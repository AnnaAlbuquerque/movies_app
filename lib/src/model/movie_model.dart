class MovieModel {
  final String backdropPath;
  final String originalLanguage;
  final String title;
  final String overview;
  final String poster;
  final String releaseDate;
  final double voteAverage;
  final double voteCount;
  final double popularity;

  MovieModel({
    required this.backdropPath,
    required this.originalLanguage,
    required this.title,
    required this.overview,
    required this.poster,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      backdropPath: map['backdrop_path'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      poster: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toDouble() ?? 0.0,
      popularity: map['popularity']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'MovieModel(backdropPath: $backdropPath, originalLanguage: $originalLanguage, title: $title, overview: $overview, poster: $poster, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount, popularity: $popularity)';
  }
}
