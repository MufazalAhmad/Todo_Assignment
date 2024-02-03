import 'package:todo_assignment/features/todos/domain/usecase/add_todo_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/delete_todo_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/get_todos_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/update_todo_usecase.dart';

abstract class TodoRepository {
  /// [Get todos]
  GetTodosUsecaseOutput getTodos(GetTodosUsecaseInput input);

  /// [Update todo]
  Future<UpdateTodoUsecaseOutput> updateTodo(UpdateTodoUsecaseInput input);

  /// [add todo]
  Future<AddTodoUsecaseOutput> addTodo(AddTodoUsecaseInput input);

  /// [delete todo]
  Future<DeleteTodoUsecaseOutput> deleteTodo(DeleteTodoUsecaseInput input);
}
