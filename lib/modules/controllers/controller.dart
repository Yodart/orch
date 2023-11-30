import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/orch.dart';
import '../../services/injection/dependency_injector.dart';

abstract class OrchController<T extends Object> with Disposable {
  OrchController() {
    init();
  }

  OrchControllerInstanceInjector<T> get injector;

  @mustCallSuper
  void init() {
    injector.inject();
  }

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
    if (!GetIt.I.isRegistered<T>(instance: _instance, instanceName: _id)) return;
    GetIt.I.unregister<T>(instance: _instance, instanceName: _id);
  }
}

class OrchControllerInstance {
  static T of<T extends OrchController>([String? id]) {
    return GetIt.I.get<T>(instanceName: id);
  }
}
