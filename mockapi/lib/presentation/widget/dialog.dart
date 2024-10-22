import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockapi/app/const/enum.dart';
import 'package:mockapi/app/utils.dart';

import '../../domain/entity/task_entity.dart';

void showEditTaskDialog({
  required BuildContext context,
  TaskEntity? task,
  required Function(TaskEntity task) onSave,
}) {
  final TextEditingController titleController =
      TextEditingController(text: task?.title ?? '');
  final TextEditingController descriptionController =
      TextEditingController(text: task?.taskDescription ?? '');

  DateTime selectedDate =
      task != null ? DateTime.parse(task.dueDate) : DateTime.now();
  TaskCompletedEnum? selectedStatus =
      task?.isCompleted ?? TaskCompletedEnum.uncompleted;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(task == null ? 'Add Task' : 'Edit Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            Row(
              children: [
                const Text('Due Date: '),
                TextButton(
                  onPressed: () {
                    selectDate(context);
                  },
                  child: Text(
                    CommonUtils.dateTimeFormat(selectedDate.toLocal(),
                        iSShowOnlyDate: true),
                  ),
                ),
              ],
            ),
            DropdownButton<TaskCompletedEnum>(
              value: selectedStatus,
              items: TaskCompletedEnum.values.map((TaskCompletedEnum status) {
                return DropdownMenuItem<TaskCompletedEnum>(
                  value: status,
                  child: Text(status.name.capitalizeFirst!),
                );
              }).toList(),
              onChanged: (TaskCompletedEnum? value) {
                selectedStatus = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final updatedTask = TaskEntity(
                id: task?.id ?? UniqueKey().toString(),
                title: titleController.text,
                taskDescription: descriptionController.text,
                dueDate: selectedDate.toIso8601String(),
                isCompleted: selectedStatus!,
                dueDateFormatted: CommonUtils.dateTimeFormat(
                  selectedDate,
                  iSShowOnlyDate: true,
                ),
              );

              onSave(updatedTask);
              Get.back();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
