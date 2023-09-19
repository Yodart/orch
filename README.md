# 🧙🏻 Orch

![Flutter](https://img.shields.io/badge/Flutter-2.0+-blue.svg)
![Pub Version](https://img.shields.io/pub/v/orch)
![License](https://img.shields.io/badge/License-MIT-green.svg)


**Installation**: Add `orch` to your `pubspec.yaml` file under `dependencies`:

```yaml
dependencies:
   orch: ^1.0.0  # Replace with the latest version
```

## Orch Entities
Orch simplifies the process of creating, serializing, deserializing, and mocking entities in your Flutter application. By implementing the recommended getter methods for mappers and proxies, you can ensure a consistent and organized approach to entity management and improve the overall efficiency of your development workflow.

### 1. Creating an Entity
Define your entity class, such as UserEntity, with the required fields and a constructor:
```dart
class UserEntity {
  final String id;
  final String name;
  final String email;
  int age;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  // Recommended getter for the entity's mapper
  static IEntityMapper<UserEntity> get mapper => _UserEntityMapper();

  // Recommended getter for the entity's proxy
  static IProxyEntity<UserEntity> get proxy => _ProxyUserEntity();
}
```

### 2. Implementing Entity Mappers
Implement the IEntityMapper interface for your entity class to enable JSON serialization and deserialization. You need to define two methods: toJson and fromJson.
```dart
class _UserEntityMapper extends IEntityMapper<UserEntity> {
  @override
  Map<String, dynamic> toJson(UserEntity entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'email': entity.email,
      'age': entity.age,
    };
  }

  @override
  UserEntity fromJson(Map json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }
}
```
To use the mapper for serialization and deserialization, you can access it using the mapper property:
```dart
final user = UserEntity(
  id: '123',
  name: 'John Doe',
  email: 'john@example.com',
  age: 30,
);

// Serialize the user to JSON
final json = UserEntity.mapper.toJson(user);

// Deserialize JSON into a user object
final newUser = UserEntity.mapper.fromJson(json);
```
### 3. Creating a Proxy Entity (Mock Entity)
For testing or development purposes, you can create a proxy entity that generates mock instances of your entity class. Implement the _ProxyUserEntity class by extending IProxyEntity.
```dart
class _ProxyUserEntity extends IProxyEntity<UserEntity> {
  @override
  UserEntity get single {
    return UserEntity(
      id: proxyId,
      name: proxyName,
      email: proxyEmail,
      age: proxyInt,
    );
  }
}
```
Now, you can use _ProxyUserEntity to generate mock user entities:
```dart
final userProxy = _ProxyUserEntity();

// Generate a single mock user
final mockUser = userProxy.single;
```


