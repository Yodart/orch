import 'dart:io';

import 'package:flutter/foundation.dart';

class CrashlyticsException implements Exception {
  CrashlyticsException(this.runtimeType, this.stackTrace, this.exception) {
    if (Platform.environment.containsKey('FLUTTER_TEST')) return;
    logError();
    reportError();
  }

  // ignore: annotate_overrides
  final Type runtimeType;
  final StackTrace stackTrace;
  final dynamic exception;

  String loggedExceptionTitle() => '${exception.toString()} @ $runtimeType';
  String? loggedExceptionDescription() => null;

  @nonVirtual
  void logError() => Logger.instance.logException(
        exception: loggedExceptionTitle(),
        stackTrace: stackTrace,
        description: loggedExceptionDescription(),
      );

  void reportError() {}
}
