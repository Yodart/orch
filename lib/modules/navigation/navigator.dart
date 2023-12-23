import 'package:flutter/material.dart';
import 'package:orch/core/orch.dart';
import 'package:orch/services/injection/dependency_injector.dart';

class OrchNavigator {
  static OrchNavigator get instance {
    return OrchDependencyInjector.instance.get<OrchNavigator>(
      ifNotRegistered: () => OrchDependencyInjector.instance.injectSingleton<OrchNavigator>(() => OrchNavigator()),
    );
  }

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
