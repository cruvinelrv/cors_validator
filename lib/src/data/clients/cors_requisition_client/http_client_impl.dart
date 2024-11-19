import 'package:http/http.dart' as http;
import 'cors_requisition_client.dart';

class HttpClientImpl implements CorsRequisitionClient {
  final http.Client _client;
  String? _baseUrl;

  HttpClientImpl(this._client);

  @override
  Future<HttpResponse> delete(String url,
      {data, Map<String, String>? headers}) async {
    final response = await _client.delete(
      Uri.parse(_baseUrl != null ? '$_baseUrl$url' : url),
      headers: headers,
      body: data,
    );
    return HttpResponse(response.statusCode, response.body);
  }

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    final response = await _client.get(
      Uri.parse(_baseUrl != null ? '$_baseUrl$url' : url),
      headers: headers,
    );
    return HttpResponse(response.statusCode, response.body);
  }

  @override
  Future<HttpResponse> post(String url,
      {data, Map<String, String>? headers}) async {
    final response = await _client.post(
      Uri.parse(_baseUrl != null ? '$_baseUrl$url' : url),
      headers: headers,
      body: data,
    );
    return HttpResponse(response.statusCode, response.body);
  }

  @override
  Future<HttpResponse> put(String url,
      {data, Map<String, String>? headers}) async {
    final response = await _client.put(
      Uri.parse(_baseUrl != null ? '$_baseUrl$url' : url),
      headers: headers,
      body: data,
    );
    return HttpResponse(response.statusCode, response.body);
  }

  @override
  void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }
}
