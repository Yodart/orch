// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';

import '../navigation/core_navigator.dart';

enum NavigationMethod { push, pushAsRoot, replace }

abstract class IModuleRoutes {
  BuildContext? get _context => CoreNavigator.instance.key.currentContext;

  dynamic contextProtectedCallback(dynamic callback) {
    if (_context == null) {
      Logger.instance.logHardWarning('Context Unprotected Route Navigation Attempt',
          description:
              'A route was attempted to be navigated to withtout the context of [CoreNavigator] being available, this is likely due to the [CoreNavigator] not being attached to the root [MaterialApp] at such point. \n');
      return null;
    }
    callback();
  }

  @mustCallSuper
  Future routeMiddleware(Route route) async {
    if (route.settings.name == null) {
      Logger.instance.logSoftWarning('An Unnamed Route has been navigated into',
          description: 'It is a best practive to always set the route settings.name on your module routes.');
    }
  }

  Future navigate(Route route, NavigationMethod method) async {
    await routeMiddleware(route);
    switch (method) {
      case NavigationMethod.push:
        return contextProtectedCallback(() => Navigator.push(_context!, route));
      case NavigationMethod.pushAsRoot:
        return contextProtectedCallback(() => Navigator.pushAndRemoveUntil(_context!, route, (route) => false));
      case NavigationMethod.replace:
        return contextProtectedCallback(() => Navigator.pushReplacement(_context!, route));
    }
  }
}
