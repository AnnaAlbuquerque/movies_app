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

  const MovieModel({
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.backdropPath == backdropPath &&
        other.originalLanguage == originalLanguage &&
        other.title == title &&
        other.overview == overview &&
        other.poster == poster &&
        other.releaseDate == releaseDate &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount &&
        other.popularity == popularity;
  }

  @override
  int get hashCode {
    return backdropPath.hashCode ^
        originalLanguage.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        poster.hashCode ^
        releaseDate.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode ^
        popularity.hashCode;
  }
}
