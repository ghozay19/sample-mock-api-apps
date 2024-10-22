import 'package:mockapi/app/const/enum.dart';
import 'package:mockapi/data/model/task_model.dart';
import 'package:mockapi/domain/entity/task_entity.dart';

import '../../app/utils.dart';

class TaskMapper {
  static TaskEntity toEntity(TaskModel model) {
    return TaskEntity(
      title: model.title,
      dueDateFormatted: CommonUtils.dateTimeFormat(
          DateTime.parse(model.duedate),
          iSShowOnlyDate: true),
      dueDate: model.duedate,
      isCompleted: model.completionStatus
          ? TaskCompletedEnum.completed
          : TaskCompletedEnum.uncompleted,
      taskDescription: model.taskDescription,
      id: model.id,
    );
  }
}
