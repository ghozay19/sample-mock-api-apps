import 'package:mockapi/const/enum.dart';

class TaskEntity {
  final String title;
  final DateTime dueDate;
  final TaskCompletedEnum isCompleted;
  final String taskDescription;
  final String id;

  TaskEntity({
    required this.title,
    required this.dueDate,
    required this.isCompleted,
    required this.taskDescription,
    required this.id,
  });
}
