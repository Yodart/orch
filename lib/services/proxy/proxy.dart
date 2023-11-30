import 'dart:math';

import 'package:faker/faker.dart';

class OrchProxy {
  int get proxyInt => faker.randomGenerator.integer(9999);
  int proxyInteger([int seed = 20]) => faker.randomGenerator.integer(seed, min: 1);
  double get proxyDouble => faker.randomGenerator.decimal();
  bool get proxyBool => faker.randomGenerator.boolean();
  String get proxyId => faker.guid.guid();
  String get proxyName => faker.person.name();
  String get proxyEmail => '${faker.person.name().replaceAll(' ', '').toLowerCase()}@gmail.com';
  String get proxyLink => faker.lorem.word().toLowerCase();
  String get proxyDescription => faker.lorem.words(faker.randomGenerator.integer(50, min: 10)).join(' ');
  DateTime get proxyDateTime => faker.date.dateTime();
  String get proxyImgUrl => 'https://picsum.photos/seed/image${faker.randomGenerator.integer(100)}/500/500';
  String get proxyCity => faker.address.city();
  String get proxyState => faker.address.state();
  String get proxyAddress => faker.address.streetName();
  String get proxyPhone => faker.phoneNumber.us();
  T proxyEnum<T>(List<T> array) => array[Random().nextInt(array.length)];
}
