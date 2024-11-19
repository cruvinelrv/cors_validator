import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:cors_validator/src/cors_validator.dart';
import 'package:cors_validator/src/domain/enums/package_requisition_enum.dart';
import 'package:cors_validator/src/data/clients/cors_requisition_client/dio_client_impl.dart';
import 'package:cors_validator/src/data/clients/cors_requisition_client/http_client_impl.dart';

class CorsValidatorFactory {
  static CorsValidator create(
      PackageRequisitionEnum requisitionType, String domain) {
    switch (requisitionType) {
      case PackageRequisitionEnum.dio:
        return CorsValidator(DioClientImpl(Dio()), domain);
      case PackageRequisitionEnum.http:
        return CorsValidator(HttpClientImpl(http.Client()), domain);
      default:
        throw UnsupportedError('Unsupported requisition type');
    }
  }
}
