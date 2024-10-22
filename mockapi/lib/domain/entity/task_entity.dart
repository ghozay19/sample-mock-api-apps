import 'package:mockapi/app/const/enum.dart';

class TaskEntity {
  final String title;
  final String dueDateFormatted;
  final String dueDate;
  final TaskCompletedEnum isCompleted;
  final String taskDescription;
  final String id;

  TaskEntity({
    required this.title,
    required this.dueDateFormatted,
    required this.dueDate,
    required this.isCompleted,
    required this.taskDescription,
    required this.id,
  });
}
