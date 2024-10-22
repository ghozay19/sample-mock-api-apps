import 'package:dartz/dartz.dart';
import 'package:mockapi/domain/entity/task_entity.dart';

import '../../app/const/failure.dart';

abstract class TaskRemoteRepository {
  Future<Either<Failure, List<TaskEntity>>> getTasks({
    required int page,
    required int limit,
  });
}
