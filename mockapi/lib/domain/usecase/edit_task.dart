import 'package:dartz/dartz.dart';
import 'package:mockapi/app/const/failure.dart';
import 'package:mockapi/domain/repository/task_remote_repository.dart';
import 'package:mockapi/domain/usecase/usecase.dart';

import '../entity/task_entity.dart';

class EditTask extends UseCase<bool, TaskEntity> {
  final TaskRemoteRepository _taskRemoteRepository;

  EditTask({required TaskRemoteRepository taskRemoteRepository})
      : _taskRemoteRepository = taskRemoteRepository;

  @override
  Future<Either<Failure, bool>> call(TaskEntity params) async {
    return await _taskRemoteRepository.editTask(taskEntity: params);
  }
}
