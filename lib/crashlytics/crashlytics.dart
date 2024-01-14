import 'package:flutter/foundation.dart';
import 'package:orch/core/orch.dart';

abstract class IOrchCrashlytics {
  void onOrchException(dynamic exception, StackTrace? stackTrace, {String? label});
  void onFlutterError(FlutterErrorDetails details) {}
  void onZonedGuardError(dynamic exception, StackTrace? stackTrace) {}
}

class OrchCrashlytics extends IOrchCrashlytics {
  @override
  void onOrchException(dynamic exception, StackTrace? stackTrace, {String? label}) {
    if (exception == null) return;
    Orch.instance.logger.logException(
      exception: '${exception.toString()} @ $runtimeType',
      stackTrace: stackTrace,
    );
  }
}
