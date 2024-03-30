class FailureModel {
  final String message;
  final String? statusCode;

  const FailureModel({
    required this.message,
    this.statusCode,
  });
}
