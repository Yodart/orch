import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:orch/core/orch.dart';
import 'package:orch/services/injection/dependency_injector.dart';

abstract class OrchController<T extends Object> with Disposable {
  OrchController() {
    init();
  }

  OrchControllerInstanceInjector<T> get injector;

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
    Orch.instance.logger.logInfo('🗑 $runtimeType ($hashCode) Successfully Disposed');
  }
}

class OrchControllerInstanceInjector<T extends Object> {
  final String? _id;
  final T _instance;

  OrchControllerInstanceInjector(this._instance, [this._id]);

  void inject() {
    OrchDependencyInjector.instance.injectSingleton<T>(() => _instance, _id);
  }

  void dispose() {
    OrchDependencyInjector.instance.unregister<T>(_instance, _id);
  }
}

class OrchControllerInstance {
  static T of<T extends OrchController>(T Function() factory, [String? id]) {
    return OrchDependencyInjector.instance.get<T>(
      instanceName: id,
      ifNotRegistered: () {
        OrchDependencyInjector.instance.injectSingleton<T>(factory, id);
      },
    );
  }
}
