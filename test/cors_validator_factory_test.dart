import 'package:test/test.dart';
import 'package:cors_validator/src/factories/cors_validator_factory.dart';
import 'package:cors_validator/src/domain/enums/package_requisition_enum.dart';
import 'package:cors_validator/src/cors_validator.dart';

void main() {
  group('CorsValidatorFactory', () {
    test('should create CorsValidator with DioClientImpl', () {
      final validator = CorsValidatorFactory.create(
          PackageRequisitionEnum.dio, 'https://example.com');
      expect(validator, isA<CorsValidator>());
    });

    test('should create CorsValidator with HttpClientImpl', () {
      final validator = CorsValidatorFactory.create(
          PackageRequisitionEnum.http, 'https://example.com');
      expect(validator, isA<CorsValidator>());
    });

    test('should throw UnsupportedError for unsupported requisition type', () {
      expect(
          () => CorsValidatorFactory.create(
              PackageRequisitionEnum.unsupported, 'https://example.com'),
          throwsUnsupportedError);
    });
  });
}
