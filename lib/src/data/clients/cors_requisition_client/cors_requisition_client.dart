abstract interface class CorsRequisitionClient {
  Future<HttpResponse> get(String url, {Map<String, String>? headers});
  Future<HttpResponse> post(String url,
      {dynamic data, Map<String, String>? headers});
  Future<HttpResponse> put(String url,
      {dynamic data, Map<String, String>? headers});
  Future<HttpResponse> delete(String url,
      {dynamic data, Map<String, String>? headers});
  void setBaseUrl(String baseUrl);
}

class HttpResponse {
  final int statusCode;
  final String body;

  HttpResponse(this.statusCode, this.body);
}
