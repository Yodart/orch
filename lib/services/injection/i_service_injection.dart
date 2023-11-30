// ignore_for_file: one_member_abstracts

import 'dependency_injector.dart';

abstract class IOrchServiceInjection {
  final OrchDependencyInjector injector = OrchDependencyInjector.instance;

  void inject() {
    isProxy ? injectProxyGateways() : injectGateways();
    injectServices();
  }

  bool get isProxy;

  void injectGateways();
  void injectProxyGateways();
  void injectServices();
}
