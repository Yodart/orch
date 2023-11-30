abstract class IOrchEntityMapper<T extends Object> {
  Map<String, dynamic> toJson(T entity);
  T fromJson(Map json);
}
