import 'dart:convert';

import 'package:dio/dio.dart';

import 'crashlytics_exception.dart';
import 'http_error.dart';

/// Implementation of [CrashlyticsException] for all [HttpException]
class HttpException extends CrashlyticsException {
  /// Creates a [HttpException]
  HttpException(Type runtimeType, StackTrace stackTrace, HttpError error) : super(runtimeType, stackTrace, error);

  JsonEncoder encoder = const JsonEncoder.withIndent('     ');

  @override
  String loggedExceptionTitle() => '🔴 HttpException Exception | ${exception.toString()}';

  @override
  String? loggedExceptionDescription() {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final HttpError httpError = exception as HttpError;
    final Response response = httpError.response;
    return 'Error Message: ${httpError.message}\n'
        '\nRequest Info:\n'
        '‣ Method: ${response.requestOptions.method}\n'
        '‣ Uri: ${response.requestOptions.uri}\n'
        '‣ Headers: ${encoder.convert(response.requestOptions.headers)}\n'
        '‣ Body Data: ${response.requestOptions.data ?? 'null'}\n'
        '‣ Query Params: ${encoder.convert(response.requestOptions.queryParameters)}\n'
        '\nResponse info:\n'
        '‣ Status Code: ${response.statusCode ?? 'null'}\n'
        '‣ Status Message: ${response.statusMessage ?? 'null'}\n'
        '‣ Data: ${response.data ?? 'null'}\n';
  }
}
