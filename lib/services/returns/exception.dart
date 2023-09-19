import 'dart:io';

import 'package:scrumbly/infra/crashlytics/crashlytics.dart';
import 'package:scrumbly/infra/logger/logger.dart';

class CoreException implements Exception {
  CoreException(this.type, this.stackTrace, this.exception) {
    if (!Platform.environment.containsKey('FLUTTER_TEST')) logError();
    reportToCrashlytics();
  }

  final Type type;
  final StackTrace stackTrace;
  final dynamic exception;

  String get method => '${type.toString()}.${stackTrace.toString().split('\n')[0]}';

  void logError() => Logger.instance.logException(exception: exception, stackTrace: stackTrace);

  void reportToCrashlytics() => Crashlytics.instance.report(exception, stackTrace);
}
