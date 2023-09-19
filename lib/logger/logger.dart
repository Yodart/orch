import 'package:flutter/material.dart';

import 'logger_config.dart';

class Logger {
  Logger._();
  static final Logger _instance = Logger._();
  static Logger get instance => _instance;

  void _log(String log, {required String symbol, String? description}) {
    final String? targetDescription = description != null ? '\n   ↳ $description\n' : null;
    final String targetLog = '$symbol Logger @ $logSessionIdentifier | $log${targetDescription ?? ''}';
    debugPrint(targetLog);
  }

  String get logSessionIdentifier => 'S$hashCode';

  void log(String log, {String? description}) => _log(log, symbol: '🟢', description: description);

  void logSoftWarning(String log, {String? description}) => _log(log, symbol: '🟡', description: description);

  void logHardWarning(String log, {String? description}) => _log(log, symbol: '🟠', description: description);

  void logException({required dynamic exception, StackTrace? stackTrace, String? description}) {
    if (!LoggerConfig.instance.logExceptions) return;
    _log(exception.toString(), symbol: '🔴', description: description);
    debugPrintStack(stackTrace: stackTrace);
  }
}
