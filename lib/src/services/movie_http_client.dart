import 'package:http/http.dart' as http;
import 'package:movies_app/src/utils/request_utils.dart';

class MovieHTTPClient {
  const MovieHTTPClient();
  Future<http.Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) {
    return http.get(
      Uri.parse(
        RequestUtils.getFullURL(url),
      ).replace(queryParameters: queryParams),
    );
  }
}
