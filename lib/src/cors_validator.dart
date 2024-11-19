import 'package:cors_validator/src/data/clients/cors_requisition_client/cors_requisition_client.dart';

class CorsValidator {
  final CorsRequisitionClient corsHttpClient;
  final String domain;

  CorsValidator(this.corsHttpClient, this.domain);

  Future<bool> validateCors() async {
    try {
      final url = domain;
      final response = await corsHttpClient.get(url);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
