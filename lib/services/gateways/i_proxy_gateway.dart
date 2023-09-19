// ignore_for_file: file_names

import '../proxy/proxy.dart';
import '../consts/consts.dart';
import '../returns/success.dart';

abstract class IProxyGateway<Gateway extends Object> extends Proxy {
  Future<T> proxyGatewayRequest<T>(T Function() callback) async {
    await Future.delayed(Default_Proxy_Gateway_Function_Delay, () {});
    return callback();
  }

  Future<SSuccess> proxyGatewaySuccessRequest() {
    return proxyGatewayRequest<SSuccess>(SSuccess.new);
  }
}
