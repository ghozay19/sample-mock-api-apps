import 'package:dartz/dartz.dart';
import 'package:mockapi/app/const/enum.dart';
import 'package:mockapi/app/const/failure.dart';

import '../model/task_model.dart';

abstract class TaskRemoteDatasource {
  Future<Either<Failure, List<TaskModel>>> getTasks({
    required int page,
    required int limit,
  });

  Future<Either<Failure, bool>> addTask({
    required String title,
    required String dueDate,
    required String description,
    required TaskCompletedEnum isCompleted,
  });

  Future<Either<Failure, bool>> editTask({
    required String id,
    required String title,
    required String dueDate,
    required String description,
    required TaskCompletedEnum isCompleted,
  });

  Future<Either<Failure, TaskModel>> getDetailTask({
    required int id,
  });
}
