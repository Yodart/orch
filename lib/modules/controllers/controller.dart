import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class Controller with Disposable {
  Controller() {
    init();
  }

  void init() {}

  void dispose();

  @override
  @mustCallSuper
  FutureOr onDispose() {
    Logger.instance.log('🗑 $runtimeType ($hashCode) Successfully Disposed');
  }
}
