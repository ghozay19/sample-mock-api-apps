import 'package:dartz/dartz.dart';
import 'package:mockapi/app/const/failure.dart';
import 'package:mockapi/domain/repository/task_remote_repository.dart';
import 'package:mockapi/domain/usecase/usecase.dart';

import '../entity/task_entity.dart';

class RetrieveTask extends UseCase<List<TaskEntity>, RetrieveTaskParams> {
  final TaskRemoteRepository _taskRemoteRepository;

  RetrieveTask({required TaskRemoteRepository taskRemoteRepository})
      : _taskRemoteRepository = taskRemoteRepository;

  @override
  Future<Either<Failure, List<TaskEntity>>> call(
      RetrieveTaskParams params) async {
    return await _taskRemoteRepository.getTasks(
      page: params.page,
      limit: params.limit,
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
