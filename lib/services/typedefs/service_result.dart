import 'package:dartz/dartz.dart';

import '../returns/failure.dart';

typedef ServiceResult<T> = Future<Either<Failure, T>>;
