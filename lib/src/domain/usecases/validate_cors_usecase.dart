import 'package:cors_validator/src/domain/entities/cors_validation_result_entity.dart';
import 'package:cors_validator/src/domain/repositories/cors_repository.dart';

class ValidateCorsUsecase {
  final CorsRepository repository;

  ValidateCorsUsecase(this.repository);

  Future<CorsValidationResultEntity> call(String domain) async {
    return await repository.validateCors(domain);
  }
}
