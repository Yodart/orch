import 'package:flutter/material.dart';
import 'package:scrumbly/infra/logger/logger.dart';

class CoreNavigator {
  CoreNavigator._();
  static final CoreNavigator _instance = CoreNavigator._();
  static CoreNavigator get instance => _instance;

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  BuildContext get context {
    final BuildContext? currentContext = key.currentContext;
    if (currentContext == null) {
      Logger.instance.logHardWarning('Null context');
      throw Exception('Null context');
    }
    return currentContext;
  }

  void pop([Object? result]) {
    Navigator.pop(context, result);
  }
}
