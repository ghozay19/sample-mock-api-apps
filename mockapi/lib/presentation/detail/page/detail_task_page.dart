import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockapi/domain/entity/task_entity.dart';
import 'package:mockapi/presentation/detail/get/detail_task_controller.dart';
import 'package:mockapi/presentation/widget/dialog.dart';

import '../../../app/const/enum.dart';
import '../../../data/network/wrapper.dart';

class DetailTaskPage extends GetView<DetailTaskController> {
  static const routeName = '/detail';
  const DetailTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(
      () {
        switch (controller.taskWrapper.status!) {
          case Status.success:
            return buildTask(context);
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.error:
            return const Center(child: Text('Something Went Wrong'));
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildTask(BuildContext context) {
    final task = controller.task;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task?.title ?? ''),
            const SizedBox(height: 16),
            const Text('Description : '),
            Text(task?.taskDescription ?? ''),
            const SizedBox(height: 16),
            const Text('Due Date : '),
            Text(task?.dueDateFormatted ?? ''),
            const SizedBox(height: 16),
            const Text('Task Status : '),
            buildStatusTask(context, task!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showEditTaskDialog(
                  context: context,
                  task: task,
                  onSave: (task) {
                    controller.updateTask(task);
                  },
                );
              },
              child: const Text('Edit Task'),
            ),
            const SizedBox(height: 16),
            Visibility(
                visible: controller.isLoading,
                replacement: const SizedBox.shrink(),
                child: const Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }

  Widget buildStatusTask(BuildContext context, TaskEntity task) {
    final isCompleted = task.isCompleted == TaskCompletedEnum.completed
        ? TaskCompletedEnum.completed.name.capitalizeFirst!
        : TaskCompletedEnum.uncompleted.name.capitalizeFirst!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: task.isCompleted == TaskCompletedEnum.completed
            ? Colors.green
            : Colors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        isCompleted,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
