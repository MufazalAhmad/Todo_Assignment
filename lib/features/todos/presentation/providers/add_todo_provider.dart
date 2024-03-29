import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_assignment/features/todos/domain/usecase/add_todo_usecase.dart';
import 'package:todo_assignment/utils/di/di.dart';

final addTodoProvider =
    FutureProvider.autoDispose.family<void, String>((ref, value) async {
  final addTodoUsecase = sl<AddTodoUsecase>();
  await addTodoUsecase(AddTodoUsecaseInput(taskTitle: value));
});
