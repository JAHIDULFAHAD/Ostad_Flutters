import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
part '../models/network_response.dart';

class NetworkCaller {
  final Logger _logger = Logger();

  final VoidCallback onUnauthorize;
  final Map<String, String>? headers;

  NetworkCaller({required this.onUnauthorize, this.headers});

  Future<NetworkResponse> getRequest({required String url, String? token}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);

      Response response = await get(uri, headers: headers);

      _logResponse(url, response);

      return _processResponse(response);
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body: body);

      Response response = await post(
        uri,
        headers: headers ?? {'content-type': 'application/json',},
        body: jsonEncode(body),
      );

      _logResponse(url, response);

      return _processResponse(response);
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  NetworkResponse _processResponse(Response response) {
    final statusCode = response.statusCode;
    final decodeData = response.body.isNotEmpty
        ? jsonDecode(response.body)
        : null;

    if (statusCode == 200 || statusCode == 201) {
      return NetworkResponse(
        isSuccess: true,
        responseCode: statusCode,
        responseData: decodeData,
      );
    } else if (statusCode == 401) {
      onUnauthorize();
      return NetworkResponse(
        isSuccess: false,
        responseCode: statusCode,
        responseData: null,
        errorMessage: 'Un-authorized',
      );
    } else {
      return NetworkResponse(
        isSuccess: false,
        responseCode: statusCode,
        responseData: decodeData,
        errorMessage: decodeData != null
            ? decodeData['msg']
            : 'Something went wrong',
      );
    }
  }

  void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i('Url => $url\nRequest Body: $body');
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      'Url => $url\nStatus Code: ${response.statusCode}\nBody: ${response.body}',
    );
  }

}

