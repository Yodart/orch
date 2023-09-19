import 'dart:convert';

import 'crashlytics_exception.dart';

/// Exceptions for all JsonParsing errors
class JsonParsingException extends CrashlyticsException {
  /// Creates a new [JsonParsingException]
  JsonParsingException(Type runtimeType, StackTrace stackTrace, exception, {required this.json})
      : super(runtimeType, stackTrace, exception);

  /// Target json
  final Map json;

  JsonEncoder encoder = const JsonEncoder.withIndent('     ');

  @override
  String loggedExceptionTitle() => 'Json Parsing Exception | ${exception.toString()}';

  @override
  String? loggedExceptionDescription() => encoder.convert(json);
}
