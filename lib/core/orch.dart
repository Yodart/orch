import '../crashlytics/crashlytics.dart';
import '../logger/logger.dart';

class Orch {
  Orch._();
  static final Orch _instance = Orch._();
  static Orch get instance => _instance;

  IOrchLogger logger = OrchLogger();
  IOrchCrashlytics crashlytics = OrchCrashlytics();

  void set({
    IOrchLogger? logger,
    IOrchCrashlytics? crashlytics,
  }) {
    this.logger = logger ?? this.logger;
    this.crashlytics = crashlytics ?? this.crashlytics;
  }
}
