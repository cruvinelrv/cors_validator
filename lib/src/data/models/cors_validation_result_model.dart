class CorsValidationResultModel {
  final bool isValid;
  final int statusCode;
  final String? body;
  final String? errorMessage;

  CorsValidationResultModel({
    required this.isValid,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });

  factory CorsValidationResultModel.fromJson(Map<String, dynamic> json) {
    return CorsValidationResultModel(
      isValid: json['status'] == 'success',
      statusCode: json['error'] != null ? json['error']['code'] : 200,
      body: json['data'] != null ? json['data']['message'] : null,
      errorMessage: json['error'] != null ? json['error']['message'] : null,
    );
  }
}
