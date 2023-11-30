import 'package:dartz/dartz.dart';
import 'package:orch/services/returns/failure.dart';

typedef OrchServiceResult<T> = Future<Either<OrchFailure, T>>;
