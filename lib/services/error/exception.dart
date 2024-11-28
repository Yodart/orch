import 'package:orch/orch.dart';

class OrchException implements Exception {
  // ignore: annotate_overrides
  final Type runtimeType;
  final StackTrace stackTrace;
  final dynamic exception;

  OrchException(this.runtimeType, this.stackTrace, this.exception) {
    Orch.instance.crashlytics.onOrchException(exception, stackTrace);
  }
}
