import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_assignment/features/todos/domain/usecase/add_todo_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/delete_todo_usecase.dart';
import 'package:todo_assignment/utils/di/di.dart';

final deleteTodoProvider =
    FutureProvider.autoDispose.family<void, String>((ref, value) async {
  final deleteTodoUsecase = sl<DeleteTodoUsecase>();
  await deleteTodoUsecase(DeleteTodoUsecaseInput(id: value));
});
