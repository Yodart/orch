import '../proxy/proxy.dart';
import '../consts/consts.dart';

abstract class IProxyEntity<T extends Object> extends Proxy {
  T get single;
  List<T> list({int length = Default_Proxy_Entity_List_Length}) => List<T>.generate(length, (_) => single);
}
