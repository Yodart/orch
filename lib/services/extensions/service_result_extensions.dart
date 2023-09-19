import 'package:dartz/dartz.dart';

import '../returns/failure.dart';

extension ServiceResultFolding<T> on Either<Failure, T> {
  dynamic get result => fold((l) => l, (r) => r);
}

extension ServiceResultListFolding<T> on Either<Failure, List<T>> {
  List<T> get reduce => fold((l) => [], (r) => r);
}
