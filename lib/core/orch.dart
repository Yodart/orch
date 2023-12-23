import 'package:orch/crashlytics/crashlytics.dart';
import 'package:orch/logger/logger.dart';
import 'package:orch/services/injection/dependency_injector.dart';

class Orch {
  static Orch get instance {
    return OrchDependencyInjector.instance.get<Orch>(
      ifNotRegistered: () => OrchDependencyInjector.instance.injectSingleton<Orch>(() => Orch()),
    );
  }

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
