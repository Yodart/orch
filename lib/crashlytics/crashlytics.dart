import 'package:flutter/foundation.dart';

class Crashlytics {
  Crashlytics._();
  static final Crashlytics _instance = Crashlytics._();
  static Crashlytics get instance => _instance;

  void report(dynamic exception, StackTrace? stackTrace, {String? tag}) {
    if (exception == null) return;
    if (kDebugMode) debugPrintStack(label: tag, stackTrace: stackTrace);
  }

  void init() {}
}
