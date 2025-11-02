import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../../Ui/Controllers/auth_controller.dart';
import '../../Ui/Screen/login_screen.dart';
import '../../app.dart';

class ApiCaller {
  static final Logger _logger = Logger();

  static Future<ApiResponse> getRequest({
    required String url,
    String? token,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);

      Response response = await get(
        uri,
        headers: {'token': token ?? ''},
      );

      _logResponse(url, response);

      return _processResponse(response);
    } on Exception catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body: body);

      Response response = await post(
        uri,
        headers: {
          'content-type': 'application/json',
          'token': token ?? '',
        },
        body: jsonEncode(body),
      );

      _logResponse(url, response);

      return _processResponse(response);
    } on Exception catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  static ApiResponse _processResponse(Response response) {
    final statusCode = response.statusCode;
    final decodeData = response.body.isNotEmpty ? jsonDecode(response.body) : null;

    if (statusCode == 200 || statusCode == 201) {
      return ApiResponse(
        isSuccess: true,
        responseCode: statusCode,
        responseData: decodeData,
      );
    } else if (statusCode == 401) {
      _movToLogin();
      return ApiResponse(
        isSuccess: false,
        responseCode: statusCode,
        responseData: null,
        errorMessage: 'Un-authorized',
      );
    } else {
      return ApiResponse(
        isSuccess: false,
        responseCode: statusCode,
        responseData: decodeData,
        errorMessage: decodeData != null ? decodeData['data'] : 'Something went wrong',
      );
    }
  }

  static void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i('Url => $url\nRequest Body: $body');
  }

  static void _logResponse(String url, Response response) {
    _logger.i('Url => $url\nStatus Code: ${response.statusCode}\nBody: ${response.body}');
  }

  static Future<void> _movToLogin() async {
    await AuthController().clearUserData();
    Navigator.pushNamedAndRemoveUntil(
      TaskManager.navigator.currentContext!,
      LoginScreen.name,
          (route) => false,
    );
  }
}

class ApiResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic responseData;
  final String? errorMessage;

  ApiResponse({
    required this.isSuccess,
    required this.responseCode,
    required this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}
