import 'package:flutter/foundation.dart';

abstract class IOrchCrashlytics {
  void report(dynamic exception, StackTrace? stackTrace, {String? label});
}

class OrchCrashlytics extends IOrchCrashlytics {
  @override
  void report(dynamic exception, StackTrace? stackTrace, {String? label}) {
    if (exception == null) return;
    if (kDebugMode) debugPrintStack(label: label, stackTrace: stackTrace);
  }
}
