import 'package:dartz/dartz.dart';
import 'package:mockapi/data/mapper/task_mapper.dart';

import '../../app/const/failure.dart';
import '../../domain/repository/task_remote_repository.dart';
import '../../domain/entity/task_entity.dart';
import '../datasource/task_remote_datasource.dart';

class TaskRemoteRepositoryImpl implements TaskRemoteRepository {
  final TaskRemoteDatasource _taskRemoteDatasource;
  TaskRemoteRepositoryImpl({required TaskRemoteDatasource datasource})
      : _taskRemoteDatasource = datasource;

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks({
    required int page,
    required int limit,
  }) async {
    final response = await _taskRemoteDatasource.getTasks(
      page: page,
      limit: limit,
    );

    return response.fold(
      (failure) => Left(failure),
      (taskList) {
        final taskEntities = taskList.map(TaskMapper.toEntity).toList();
        return Right(taskEntities);
      },
    );
  }

  @override
  Future<Either<Failure, bool>> addTask({
    required TaskEntity taskEntity,
  }) async {
    final response = await _taskRemoteDatasource.addTask(
      title: taskEntity.title,
      dueDate: taskEntity.dueDateFormatted,
      description: taskEntity.taskDescription,
      isCompleted: taskEntity.isCompleted,
    );

    return response.fold(
      (failure) => Left(failure),
      (result) {
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, bool>> editTask({
    required TaskEntity taskEntity,
  }) async {
    final response = await _taskRemoteDatasource.editTask(
      id: taskEntity.id,
      title: taskEntity.title,
      dueDate: taskEntity.dueDate,
      description: taskEntity.taskDescription,
      isCompleted: taskEntity.isCompleted,
    );

    return response.fold(
      (failure) => Left(failure),
      (result) {
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, TaskEntity>> getDetailTask({required int id}) async {
    final response = await _taskRemoteDatasource.getDetailTask(
      id: id,
    );

    return response.fold((failure) => Left(failure), (result) {
      final mappedData = TaskMapper.toEntity(result);
      return Right(mappedData);
    });
  }
}
