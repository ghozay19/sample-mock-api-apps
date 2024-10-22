import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mockapi/app/const/enum.dart';
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
        AppEndpoints.task,
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

  @override
  Future<Either<Failure, bool>> addTask({
    required String title,
    required String dueDate,
    required String description,
    required TaskCompletedEnum isCompleted,
  }) async {
    try {
      final response = await _client.post(
        AppEndpoints.task,
        data: {
          'title': title,
          'duedate': dueDate,
          'completionStatus': isCompleted.value == 1 ? true : false,
          'description': description,
        },
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return const Right(false);
      }
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

  @override
  Future<Either<Failure, bool>> editTask({
    required String id,
    required String title,
    required String dueDate,
    required String description,
    required TaskCompletedEnum isCompleted,
  }) async {
    try {
      final response = await _client.put(
        '${AppEndpoints.task}/$id',
        data: {
          'title': title,
          'duedate': dueDate,
          'completionStatus': isCompleted.value == 1 ? true : false,
          'description': description,
        },
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Right(false);
      }
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

  @override
  Future<Either<Failure, TaskModel>> getDetailTask({required int id}) async {
    try {
      final response = await _client.get(
        '${AppEndpoints.task}/$id',
      );
      return Right(TaskModel.fromJson(response.data));
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

  @override
  Future<Either<Failure, bool>> deleteTask({required int id}) async {
    try {
      final response = await _client.delete(
        '${AppEndpoints.task}/$id',
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Right(false);
      }
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
