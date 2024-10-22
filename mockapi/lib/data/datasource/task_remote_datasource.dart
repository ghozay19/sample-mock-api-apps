import 'package:dartz/dartz.dart';
import 'package:mockapi/app/const/failure.dart';

import '../model/task_model.dart';

abstract class TaskRemoteDatasource {
  Future<Either<Failure, List<TaskModel>>> getTasks({
    required int page,
    required int limit,
  });
}
