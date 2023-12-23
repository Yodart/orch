// ignore_for_file: always_specify_types

import 'package:dartz/dartz.dart';
import 'package:orch/core/orch.dart';
import 'package:orch/services/returns/failure.dart';
import 'package:orch/services/typedefs/service_result.dart';

abstract class IOrchService {
  OrchServiceResult<T> singlePathServiceRequest<T>(Future<T> Function() callback) async {
    try {
      final T gatewayResult = await callback();
      return Right(gatewayResult);
    } catch (exception, stackTrace) {
      Orch.instance.logger.logException(exception: exception, stackTrace: stackTrace);
      return Left(OrchFailure());
    }
  }
}
