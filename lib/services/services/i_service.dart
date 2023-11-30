// ignore_for_file: always_specify_types

import 'package:dartz/dartz.dart';

import '../returns/failure.dart';
import '../typedefs/service_result.dart';

abstract class IOrchService {
  IOrchService get instance;

  OrchServiceResult<T> singlePathServiceRequest<T>(Future<T> Function() callback) async {
    try {
      final T gatewayResult = await callback();
      return Right(gatewayResult);
    } on Exception {
      return Left(OrchFailure());
    }
  }
}
