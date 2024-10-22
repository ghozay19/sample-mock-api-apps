import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:mockapi/domain/usecase/retrieve_detail_task.dart';
import 'package:mockapi/presentation/detail/get/detail_task_controller.dart';

import '../../../data/datasource/task_remote_datasource.dart';
import '../../../data/datasource/task_remote_datasource_impl.dart';
import '../../../data/repository/task_remote_repository_impl.dart';
import '../../../domain/repository/task_remote_repository.dart';
import '../../../domain/usecase/edit_task.dart';

class DetailTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TaskRemoteDatasource>(
      TaskRemoteDatasourceImpl(
        client: Get.find<Dio>(),
      ),
    );

    Get.put<TaskRemoteRepository>(
      TaskRemoteRepositoryImpl(
        datasource: Get.find<TaskRemoteDatasource>(),
      ),
    );

    Get.put<RetrieveDetailTask>(
      RetrieveDetailTask(
        taskRemoteRepository: Get.find<TaskRemoteRepository>(),
      ),
    );

    Get.put<EditTask>(
      EditTask(
        taskRemoteRepository: Get.find<TaskRemoteRepository>(),
      ),
    );

    Get.put<DetailTaskController>(
      DetailTaskController(
        detailTask: Get.find<RetrieveDetailTask>(),
        editTask: Get.find<EditTask>(),
      ),
    );
  }
}
