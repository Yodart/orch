// ignore_for_file: one_member_abstracts

import 'package:scrumbly/infra/config/config.dart';

import 'dependency_injector.dart';

abstract class IServiceInjection {
  final DependencyInjector injector = DependencyInjector.instance;

  void inject() {
    Config.instance.env == ConfigEnv.proxy ? injectProxyGateways() : injectGateways();
    injectServices();
  }

  void injectGateways();
  void injectProxyGateways();
  void injectServices();
}
