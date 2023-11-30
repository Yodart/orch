import 'package:flutter/material.dart';

abstract class IOrchLogger {
  void log(String log, {required String symbol, String? description});

  String get logSessionIdentifier => 'S$hashCode';

  void logInfo(String log, {String? description}) => this.log(log, symbol: '🟢', description: description);

  void logSoftWarning(String log, {String? description}) => this.log(log, symbol: '🟡', description: description);

  void logHardWarning(String log, {String? description}) => this.log(log, symbol: '🟠', description: description);

  void logException({required dynamic exception, StackTrace? stackTrace, String? description}) {
    debugPrint('\n');
    log(exception.toString(), symbol: '🔴', description: description);
    debugPrint('-------------------------------------------------------------');
    debugPrintStack(stackTrace: stackTrace);
    debugPrint('\n-------------------------------------------------------------\n');
  }
}

class OrchLogger extends IOrchLogger {
  @override
  void log(String log, {required String symbol, String? description}) {
    final String? targetDescription = description != null ? '\n   ↳ $description\n' : null;
    final String targetLog = '$symbol Logger @ $logSessionIdentifier | $log${targetDescription ?? ''}';
    debugPrint(targetLog);
  }
}
