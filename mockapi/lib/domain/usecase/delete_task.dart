import 'package:dartz/dartz.dart';
import 'package:mockapi/app/const/failure.dart';
import 'package:mockapi/domain/repository/task_remote_repository.dart';
import 'package:mockapi/domain/usecase/usecase.dart';

class DeleteTask extends UseCase<bool, int> {
  final TaskRemoteRepository _taskRemoteRepository;

  DeleteTask({required TaskRemoteRepository taskRemoteRepository})
      : _taskRemoteRepository = taskRemoteRepository;

  @override
  Future<Either<Failure, bool>> call(int params) async {
    return await _taskRemoteRepository.deleteTask(id: params);
  }
}
