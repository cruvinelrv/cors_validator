class CorsValidationResultEntity {
  final bool isValid;
  final int statusCode;
  final String? body;
  final String? errorMessage;

  CorsValidationResultEntity({
    required this.isValid,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });
}
