import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class SingletonOrchController {
  SingletonOrchController() {
    init();
  }

  @mustCallSuper
  void init() {}
}

class SingletonOrchControllerInstance {
  static T of<T extends SingletonOrchController>(T Function() factory) {
    if (!GetIt.I.isRegistered<T>()) {
      GetIt.I.registerLazySingleton(factory);
    }

    return GetIt.I.get<T>();
  }
}
