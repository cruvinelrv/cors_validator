import 'package:cors_validator/src/data/clients/cors_requisition_client/dio_client_impl.dart';
import 'package:cors_validator/src/data/clients/cors_requisition_client/http_client_impl.dart';
import 'package:cors_validator/src/data/models/cors_validation_result_model.dart';
import 'package:cors_validator/src/domain/entities/cors_validation_result_entity.dart';
import 'package:cors_validator/src/domain/repositories/cors_repository.dart';
import 'package:cors_validator/src/domain/enums/package_requisition_enum.dart';

class CorsRepositoryImpl implements CorsRepository {
  final PackageRequisitionEnum requisitionType;
  final DioClientImpl dioClient;
  final HttpClientImpl httpClient;

  CorsRepositoryImpl(this.requisitionType, this.dioClient, this.httpClient);

  @override
  Future<CorsValidationResultEntity> validateCors(String domain) async {
    try {
      final response = await (requisitionType == PackageRequisitionEnum.dio
          ? dioClient.get(domain)
          : httpClient.get(domain));
      final model = CorsValidationResultModel(
        isValid: response.statusCode == 200,
        statusCode: response.statusCode,
        body: response.body,
      );
      return CorsValidationResultEntity(
        isValid: model.isValid,
        statusCode: model.statusCode,
        body: model.body,
        errorMessage: model.errorMessage,
      );
    } catch (e) {
      return CorsValidationResultEntity(
        isValid: false,
        statusCode: 0,
        errorMessage: e.toString(),
      );
    }
  }
}
