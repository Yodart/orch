import 'package:dio/dio.dart';

class HttpError extends DioError {
  HttpError(this.response, {this.errorMessage}) : super(requestOptions: response.requestOptions);

  final String? errorMessage;
  // ignore: annotate_overrides, overridden_fields
  final Response response;
}
