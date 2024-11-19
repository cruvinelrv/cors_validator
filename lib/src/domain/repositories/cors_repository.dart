import 'package:cors_validator/src/domain/entities/cors_validation_result_entity.dart';

abstract interface class CorsRepository {
  Future<CorsValidationResultEntity> validateCors(String domain);
}
