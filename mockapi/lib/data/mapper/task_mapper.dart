import 'package:mockapi/const/enum.dart';
import 'package:mockapi/data/model/task_model.dart';
import 'package:mockapi/task_entity.dart';

class TaskMapper {
  static TaskEntity toEntity(TaskModel model) {
    return TaskEntity(
      title: model.title,
      dueDate: DateTime.parse(model.duedate),
      isCompleted: model.completionStatus
          ? TaskCompletedEnum.completed
          : TaskCompletedEnum.uncompleted,
      taskDescription: model.taskDescription,
      id: model.id,
    );
  }
}
