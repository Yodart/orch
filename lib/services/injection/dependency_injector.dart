import 'dart:async';

import 'package:get_it/get_it.dart';

class DependencyInjector {
  DependencyInjector._();
  static final DependencyInjector _instance = DependencyInjector._();
  static DependencyInjector get instance => _instance;

  T get<T extends Object>() => GetIt.I.get<T>();

  void injectSingleton<T extends Object>(T Function() factory) => GetIt.I.registerLazySingleton(factory);

  FutureOr resetLazySingleton<T extends Object>() => GetIt.I.resetLazySingleton<T>();
}
