import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockapi/domain/entity/task_entity.dart';
import 'package:mockapi/domain/usecase/retrieve_detail_task.dart';

import '../../../data/network/wrapper.dart';
import '../../../domain/usecase/edit_task.dart';
import '../../widget/toast.dart';

class DetailTaskController extends GetxController {
  final RetrieveDetailTask _detailTask;
  final EditTask _editTask;

  DetailTaskController({
    required RetrieveDetailTask detailTask,
    required EditTask editTask,
  })  : _detailTask = detailTask,
        _editTask = editTask;

  final _taskWrapper = Rx<DataWrapper<TaskEntity>>(DataWrapper.init());
  DataWrapper<TaskEntity> get taskWrapper => _taskWrapper.value;
  TaskEntity? get task => _taskWrapper.value.data;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    retrieveArguments();
    super.onInit();
  }

  void retrieveArguments() {
    final args = Get.arguments;
    if (args is TaskEntity) {
      getDetailTask(int.parse(args.id));
    }
  }

  Future<void> getDetailTask(int id, [bool isUseLoading = true]) async {
    if (isUseLoading) {
      _taskWrapper.value = DataWrapper.loading();
    }

    final result = await _detailTask.call(
      id,
    );
    result.fold(
      (failure) {
        debugPrint('Error occurred: $failure');
        final errorMessage = failure.toString();
        showToast(message: errorMessage);
        _taskWrapper.value = DataWrapper.error(message: errorMessage);
      },
      (result) {
        _taskWrapper.value = DataWrapper.success(result);
      },
    );
  }

  Future<void> updateTask(TaskEntity task) async {
    _isLoading.value = true;
    final result = await _editTask.call(
      task,
    );
    result.fold(
      (failure) {
        _isLoading.value = false;
        debugPrint('Error occurred: $failure');
        final errorMessage = failure.toString();
        showToast(message: errorMessage);
      },
      (result) {
        _isLoading.value = false;
        showToast(message: 'Task updated successfully');
        getDetailTask(int.parse(task.id), false);
      },
    );
  }
}
