import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/domain/usecase/add_todo_usecase.dart';
import 'package:todo_assignment/utils/di/di.dart';

final updateTodoProvider =
    FutureProvider.autoDispose.family<void, TodoModel>((ref, model) async {
  final addTodoUsecase = sl<AddTodoUsecase>();
  await addTodoUsecase(AddTodoUsecaseInput(todo: model));
});
