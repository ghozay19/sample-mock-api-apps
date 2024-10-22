import 'package:dartz/dartz.dart';
import 'package:mockapi/app/const/failure.dart';
import 'package:mockapi/domain/repository/task_remote_repository.dart';
import 'package:mockapi/domain/usecase/usecase.dart';

import '../entity/task_entity.dart';

class RetrieveDetailTask extends UseCase<TaskEntity, int> {
  final TaskRemoteRepository _taskRemoteRepository;

  RetrieveDetailTask({required TaskRemoteRepository taskRemoteRepository})
      : _taskRemoteRepository = taskRemoteRepository;

  @override
  Future<Either<Failure, TaskEntity>> call(int params) async {
    return await _taskRemoteRepository.getDetailTask(
      id: params,
    );
  }
}

class RetrieveTaskParams {
  int page;
  int limit;

  RetrieveTaskParams({
    required this.page,
    this.limit = 10,
  });
}
