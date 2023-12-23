import 'package:dartz/dartz.dart';
import 'package:orch/services/returns/failure.dart';

extension OrchServiceResultFolding<T> on Either<OrchFailure, T> {
  dynamic get result => fold((l) => l, (r) => r);
}

extension OrchServiceResultListFolding<T> on Either<OrchFailure, List<T>> {
  List<T> get reduce => fold((l) => [], (r) => r);
}
