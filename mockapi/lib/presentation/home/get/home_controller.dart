import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockapi/domain/entity/task_entity.dart';
import 'package:mockapi/domain/usecase/retrieve_tasks.dart';
import 'package:mockapi/presentation/widget/toast.dart';

import '../../../app/const/string.dart';
import '../../../data/network/wrapper.dart';
import '../../../domain/usecase/edit_task.dart';

class HomeController extends GetxController {
  final RetrieveTask _retrieveTask;
  final EditTask _editTask;

  HomeController({
    required RetrieveTask retrieveTask,
    required EditTask editTask,
  })  : _retrieveTask = retrieveTask,
        _editTask = editTask;

  final _listTask = Rx<DataWrapper<List<TaskEntity>>>(DataWrapper.init());

  DataWrapper<List<TaskEntity>> get listTaskWrapper => _listTask.value;

  List<TaskEntity> get tasks => listTaskWrapper.data ?? [];

  final currentPage = 1.obs;
  final _isHasReachMax = false.obs;
  bool get isHasReachMax => _isHasReachMax.value;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks([bool isLoadingMore = false]) async {
    if (!isLoadingMore) {
      (listTaskWrapper.data ?? []).clear();
      currentPage.value = 1;
      _listTask.value = DataWrapper.loading();
    }

    final result = await _retrieveTask.call(
      RetrieveTaskParams(
        page: currentPage(),
      ),
    );
    result.fold(
      (exception) {
        debugPrint('Error occurred: $exception');
        final errorMessage = exception.toString();
        showToast(message: errorMessage);
        _listTask.value = DataWrapper.error(message: errorMessage);
      },
      (result) {
        if (result.isEmpty) {
          _isHasReachMax.value = true;
          final tempReward = listTaskWrapper.data ?? [];
          _listTask.value = DataWrapper.success(tempReward);

          if (tempReward.isEmpty) {
            showToast(message: reachMax);
          }
        } else {
          final tempTask = listTaskWrapper.data ?? [];

          for (final newTask in result) {
            if (!tempTask.any((task) => task == newTask)) {
              tempTask.add(newTask);
            }
          }

          _listTask.value = DataWrapper.success(tempTask);
        }
      },
    );
  }

  Future<void> updateTask(TaskEntity task) async {
    final result = await _editTask.call(
      task,
    );
    result.fold(
      (failure) {
        debugPrint('Error occurred: $failure');
        final errorMessage = failure.toString();
        showToast(message: errorMessage);
      },
      (result) {
        showToast(message: 'Task updated successfully');
        fetchTasks();
      },
    );
  }
}
