import 'i_proxy_gateway.dart';

abstract class IGateway<TGateway extends Object> {
  IProxyGateway<TGateway> get proxy;
}
