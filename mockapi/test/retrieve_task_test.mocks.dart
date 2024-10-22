// Mocks generated by Mockito 5.4.4 from annotations
// in mockapi/test/retrieve_task_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockapi/app/const/failure.dart' as _i5;
import 'package:mockapi/domain/entity/task_entity.dart' as _i6;
import 'package:mockapi/domain/repository/task_remote_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TaskRemoteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRemoteRepository extends _i1.Mock
    implements _i3.TaskRemoteRepository {
  MockTaskRemoteRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TaskEntity>>> getTasks({
    required int? page,
    required int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTasks,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.TaskEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.TaskEntity>>(
          this,
          Invocation.method(
            #getTasks,
            [],
            {
              #page: page,
              #limit: limit,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TaskEntity>>>);
}
