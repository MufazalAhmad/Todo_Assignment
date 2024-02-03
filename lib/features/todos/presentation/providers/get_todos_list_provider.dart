import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/domain/usecase/get_todos_usecase.dart';
import 'package:todo_assignment/utils/di/di.dart';

final getTodosList = StreamProvider.autoDispose<List<TodoModel>>((ref) {
  final getTodosUsecase = sl<GetTodosUsecase>();
  final output = getTodosUsecase(GetTodosUsecaseInput());
  return output.todos;
});
