import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mockapi/app/const/failure.dart';
import 'package:mockapi/data/datasource/task_remote_datasource.dart';
import 'package:mockapi/data/model/task_model.dart';

import '../../app/const/app_endpoints.dart';

class TaskRemoteDatasourceImpl extends TaskRemoteDatasource {
  final Dio _client;

  TaskRemoteDatasourceImpl({required Dio client}) : _client = client;

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _client.get(
        AppEndpoints.getTask,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      final List<dynamic> data = response.data;
      final listTask = data.map((json) => TaskModel.fromJson(json)).toList();
      return Right(listTask);
    } on DioException catch (error) {
      if (error.type == DioExceptionType.unknown) {
        return Left(
          NetworkFailure('Network error: ${error.message}'),
        );
      } else {
        return Left(
          ServerFailure(
              'Server error: ${error.response?.statusMessage ?? 'Unknown error'}'),
        );
      }
    } catch (error) {
      return Left(
        ServerFailure('Unexpected error: $error'),
      );
    }
  }
}
