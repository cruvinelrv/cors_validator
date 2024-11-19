import 'package:dio/dio.dart';
import 'cors_requisition_client.dart';

class DioClientImpl implements CorsRequisitionClient {
  final Dio _dio;

  DioClientImpl(this._dio);

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.get(url, options: Options(headers: headers));
      return HttpResponse(response.statusCode ?? 0, response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> post(String url,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      final response =
          await _dio.post(url, data: data, options: Options(headers: headers));
      return HttpResponse(response.statusCode ?? 0, response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> put(String url,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      final response =
          await _dio.put(url, data: data, options: Options(headers: headers));
      return HttpResponse(response.statusCode ?? 0, response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> delete(String url,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      final response = await _dio.delete(url,
          data: data, options: Options(headers: headers));
      return HttpResponse(response.statusCode ?? 0, response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }
}
