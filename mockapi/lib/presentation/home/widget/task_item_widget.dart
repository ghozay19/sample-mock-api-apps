import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockapi/domain/entity/task_entity.dart';
import '../../../app/const/enum.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskEntity task;
  final Function(TaskEntity) onDelete;
  final Function(TaskEntity) onEdit;
  final Function(TaskEntity) onTap;

  const TaskItemWidget({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onEdit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(task),
      child: Dismissible(
        key: Key(task.id),
        background: buildSwipeActionLeft(),
        secondaryBackground: buildSwipeActionRight(),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            onEdit(task);
            return false;
          } else if (direction == DismissDirection.endToStart) {
            final bool confirm = await _showDeleteConfirmationDialog(context);
            return confirm;
          }
          return false;
        },
        child: buildTaskCard(context),
      ),
    );
  }

  Widget buildTaskCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title),
                    Text(task.dueDateFormatted),
                  ],
                ),
              ),
              buildStatusTask(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatusTask(BuildContext context) {
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

  Widget buildSwipeActionLeft() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      color: Colors.blue,
      child: const Icon(Icons.edit, color: Colors.white),
    );
  }

  Widget buildSwipeActionRight() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      color: Colors.red,
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }

  Future<bool> _showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
