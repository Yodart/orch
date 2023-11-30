import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OrchDependencyInjector {
  OrchDependencyInjector._();
  static final OrchDependencyInjector _instance = OrchDependencyInjector._();
  static OrchDependencyInjector get instance => _instance;

  T get<T extends Object>({VoidCallback? ifNotRegistered}) {
    if (!GetIt.I.isRegistered<T>()) {
      ifNotRegistered?.call();
    }
    return GetIt.I.get<T>();
  }

  void injectSingleton<T extends Object>(T Function() factory, [String? instanceName]) {
    if (GetIt.I.isRegistered<T>(instanceName: instanceName)) return;
    GetIt.I.registerLazySingleton(factory, instanceName: instanceName);
  }

  FutureOr resetLazySingleton<T extends Object>() => GetIt.I.resetLazySingleton<T>();
}
