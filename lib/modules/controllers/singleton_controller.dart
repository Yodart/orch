import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:orch/core/orch.dart';
import 'package:orch/services/injection/dependency_injector.dart';

abstract class OrchSingletonController<T extends Object> with Disposable {
  OrchSingletonController() {
    init();
  }

  OrchSingletonControllerInjector<T> get injector;

  @mustCallSuper
  void init() {
    injector.inject();
  }

  @nonVirtual
  @mustCallSuper
  void dispose() {
    injector.dispose();
  }

  @override
  @mustCallSuper
  FutureOr onDispose() {
    Orch.instance.logger.logInfo('🧩 $runtimeType ($hashCode) Successfully Resetted');
  }
}

class OrchSingletonControllerInjector<T extends Object> {
  final T _instance;

  OrchSingletonControllerInjector(this._instance);

  void inject() {
    OrchDependencyInjector.instance.injectSingleton<T>(() => _instance);
  }

  void dispose() {
    OrchDependencyInjector.instance.reset<T>(_instance);
  }
}

class OrchSingletonControllerInstance {
  static T of<T extends OrchSingletonController>(T Function() factory, [String? id]) {
    return OrchDependencyInjector.instance.get<T>(
      instanceName: id,
      ifNotRegistered: () {
        OrchDependencyInjector.instance.injectSingleton<T>(factory, id);
      },
    );
  }
}
