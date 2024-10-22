class TaskModel {
  final String title;
  final String duedate;
  final bool completionStatus;
  final String taskDescription;
  final String id;

  TaskModel({
    required this.title,
    required this.duedate,
    required this.completionStatus,
    required this.taskDescription,
    required this.id,
  });

  // JSON Serialization
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      duedate: json['duedate'],
      completionStatus: json['completionStatus'],
      taskDescription: json['taskDescription'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'duedate': duedate,
      'completionStatus': completionStatus,
      'taskDescription': taskDescription,
      'id': id,
    };
  }
}
