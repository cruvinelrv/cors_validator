import 'package:cors_validator/src/data/clients/cors_requisition_client/dio_client_impl.dart';
import 'package:cors_validator/src/data/clients/cors_requisition_client/http_client_impl.dart';
import 'package:cors_validator/src/data/models/cors_validation_result_model.dart';
import 'package:cors_validator/src/data/datasources/cors_datasource.dart';
import 'package:cors_validator/src/domain/enums/package_requisition_enum.dart';

class CorsDatasourceImpl implements CorsDatasource {
  final PackageRequisitionEnum requisitionType;
  final DioClientImpl dioClient;
  final HttpClientImpl httpClient;

  CorsDatasourceImpl(this.requisitionType, this.dioClient, this.httpClient);

  @override
  Future<CorsValidationResultModel> validateCors(String url) async {
    final response = await (requisitionType == PackageRequisitionEnum.dio
        ? dioClient.get(url)
        : httpClient.get(url));
    return CorsValidationResultModel(
      isValid: response.statusCode == 200,
      statusCode: response.statusCode,
      body: response.body,
    );
  }
}
