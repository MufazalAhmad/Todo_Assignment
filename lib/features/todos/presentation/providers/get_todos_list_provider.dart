import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/domain/usecase/get_todos_usecase.dart';
import 'package:todo_assignment/utils/di/di.dart';

final getTodosList = FutureProvider.autoDispose<List<TodoModel>>((ref) async {
  final getTodosUsecase = sl<GetTodosUsecase>();

  final output = await getTodosUsecase(GetTodosUsecaseInput());
  final todos = output.todos;
  return todos;
});
