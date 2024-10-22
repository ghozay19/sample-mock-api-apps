import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockapi/app/const/enum.dart';
import 'package:mockapi/domain/entity/task_entity.dart';
import 'package:mockapi/domain/usecase/retrieve_tasks.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:mockapi/domain/repository/task_remote_repository.dart';

import 'retrieve_task_test.mocks.dart';

@GenerateMocks([TaskRemoteRepository])
void main() {
  late RetrieveTask usecase;
  late MockTaskRemoteRepository mockTaskRemoteRepository;

  setUp(() {
    mockTaskRemoteRepository = MockTaskRemoteRepository();
    usecase = RetrieveTask(taskRemoteRepository: mockTaskRemoteRepository);
  });

  final testTasks = [
    TaskEntity(
      title: "Test Task 1",
      dueDate: DateTime.now(),
      isCompleted: TaskCompletedEnum.uncompleted,
      taskDescription: "Test description",
      id: "1",
    ),
    TaskEntity(
      title: "Test Task 2",
      dueDate: DateTime.now(),
      isCompleted: TaskCompletedEnum.completed,
      taskDescription: "Another description",
      id: "2",
    ),
  ];

  final testParams = RetrieveTaskParams(page: 1, limit: 10);

  test('should return list of tasks from repository', () async {
    // Arrange
    when(mockTaskRemoteRepository.getTasks(page: 1, limit: 10))
        .thenAnswer((_) async => Right(testTasks));

    // Act
    final result = await usecase(testParams);

    // Assert
    expect(result, Right(testTasks));
    verify(mockTaskRemoteRepository.getTasks(page: 1, limit: 10));
    verifyNoMoreInteractions(mockTaskRemoteRepository);
  });
}
