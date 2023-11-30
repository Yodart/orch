import '../proxy/proxy.dart';

abstract class IOrchProxyEntity<T extends Object> extends OrchProxy {
  T get single;
  List<T> list({int length = 30}) => List<T>.generate(length, (_) => single);
}
