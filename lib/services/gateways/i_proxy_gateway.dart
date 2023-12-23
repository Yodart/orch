// ignore_for_file: file_names

import 'package:orch/services/proxy/proxy.dart';
import 'package:orch/services/returns/success.dart';

abstract class IOrchProxyGateway<Gateway extends Object> extends OrchProxy {
  Future<T> proxyGatewayRequest<T>(T Function() callback) async {
    await Future.delayed(const Duration(milliseconds: 750), () {});
    return callback();
  }

  Future<OrchSuccess> proxyGatewaySuccessRequest() {
    return proxyGatewayRequest<OrchSuccess>(OrchSuccess.new);
  }
}
