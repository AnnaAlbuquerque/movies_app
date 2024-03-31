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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenreModel && other.id == id && other.genreName == genreName;
  }

  @override
  int get hashCode => id.hashCode ^ genreName.hashCode;
}
