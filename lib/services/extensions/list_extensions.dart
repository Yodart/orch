import 'dart:math';

extension ListExtensions<T> on List<T> {
  T get random => this[Random().nextInt(length)];
}
