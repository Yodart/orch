import 'i_proxy_gateway.dart';

abstract class IOrchGateway<TGateway extends Object> {
  IOrchProxyGateway<TGateway> get proxy;
}
