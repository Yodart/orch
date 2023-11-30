// ignore_for_file: cascade_invocations

import 'dart:collection';

import 'package:flutter/material.dart';

import '../../orch.dart';

class OrchRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  OrchRouteObserver._();
  static final OrchRouteObserver _instance = OrchRouteObserver._();
  static OrchRouteObserver get instance => _instance;

  Queue<Route<dynamic>?> routeStack = Queue<Route<dynamic>?>();
  Route<dynamic>? get currentRoute => routeStack.last;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    routeStack.add(route);
    Orch.instance.logger.logInfo(
      'Navigating: ${previousRoute?.settings.name ?? '/splash'} -> ${route.settings.name}',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    routeStack.removeLast();
    routeStack.add(newRoute);
    Orch.instance.logger.logInfo(
      'Navigating: ${oldRoute?.settings.name ?? '/unknown'} -> ${newRoute?.settings.name ?? '/unknown'}',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    routeStack.removeLast();
    Orch.instance.logger.logInfo(
      'Navigating: ${previousRoute?.settings.name ?? '/unknown'} <- ${route.settings.name ?? '/unknown'}',
    );
  }
}
