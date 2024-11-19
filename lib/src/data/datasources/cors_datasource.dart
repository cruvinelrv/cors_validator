import 'package:cors_validator/src/data/models/cors_validation_result_model.dart';

abstract class CorsDatasource {
  Future<CorsValidationResultModel> validateCors(String url);
}
