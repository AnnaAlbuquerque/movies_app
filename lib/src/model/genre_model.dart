class GenreModel {
  final int id;
  final String genreName;

  const GenreModel({
    required this.id,
    required this.genreName,
  });

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id'] ?? 0,
      genreName: map['name'] ?? '',
    );
  }

  @override
  String toString() => 'GenreModel(id: $id, genreName: $genreName)';
}
