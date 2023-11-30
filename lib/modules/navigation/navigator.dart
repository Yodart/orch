import 'package:flutter/material.dart';
import 'package:orch/orch.dart';

class OrchNavigator {
  OrchNavigator._();
  static final OrchNavigator _instance = OrchNavigator._();
  static OrchNavigator get instance => _instance;

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  BuildContext get context {
    final BuildContext? currentContext = key.currentContext;
    if (currentContext == null) {
      Orch.instance.logger.logHardWarning('Null context');
      throw Exception('Null context');
    }
    return currentContext;
  }

  void pop([Object? result]) {
    Navigator.pop(context, result);
  }
}
