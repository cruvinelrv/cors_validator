# cors_validator

This package offers a simple way to validate CORS in Flutter/Dart applications. It allows you to choose between two popular HTTP request libraries: Dio or http.

## Instalation

Add the dependency to your `pubspec.yaml`:

```yaml
dev_dependencies:
  cors_validator: ^0.0.1
```

## How use in your application

```dart
import 'package:cors_validator/cors_validator.dart';
import 'package:cors_validator/src/package_requisition_enum.dart';

void main() async {
  final validateCors = CorsValidatorFactory.create(
    PackageRequisitionEnum.dio, // ou PackageRequisitionEnum.http
    'https://example.com',
  );

  final result = await validateCors('https://example.com');

  if (result.isValid) {
    print('CORS is valid: ${result.statusCode}');
  } else {
    print('CORS validation failed: ${result.errorMessage}');
  }
}
```


