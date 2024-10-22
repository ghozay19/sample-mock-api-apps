import 'package:dartz/dartz.dart';
import 'package:mockapi/const/failure.dart';

import '../model/task_model.dart';

abstract class TaskRemoteDatasource {
  Future<Either<Failure, List<TaskModel>>> getTasks({
    required String page,
    required String limit,
  });
}
