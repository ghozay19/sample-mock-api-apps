import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mockapi/domain/usecase/delete_task.dart';
import 'package:mockapi/domain/usecase/retrieve_tasks.dart';

import '../../../data/datasource/task_remote_datasource.dart';
import '../../../data/datasource/task_remote_datasource_impl.dart';
import '../../../data/repository/task_remote_repository_impl.dart';
import '../../../domain/repository/task_remote_repository.dart';
import '../../../domain/usecase/edit_task.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
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

    Get.put<RetrieveTask>(
      RetrieveTask(
        taskRemoteRepository: Get.find<TaskRemoteRepository>(),
      ),
    );

    Get.put<EditTask>(
      EditTask(
        taskRemoteRepository: Get.find<TaskRemoteRepository>(),
      ),
    );

    Get.put<DeleteTask>(
      DeleteTask(
        taskRemoteRepository: Get.find<TaskRemoteRepository>(),
      ),
    );

    Get.put<HomeController>(
      HomeController(
        retrieveTask: Get.find<RetrieveTask>(),
        editTask: Get.find<EditTask>(),
        deleteTask: Get.find<DeleteTask>(),
      ),
    );
  }
}
