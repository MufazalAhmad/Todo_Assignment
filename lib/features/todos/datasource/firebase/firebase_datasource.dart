import 'package:todo_assignment/features/todos/domain/usecase/add_todo_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/get_todos_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/update_todo_usecase.dart';
import 'package:todo_assignment/infrastructure/usecase_input.dart';
import 'package:todo_assignment/infrastructure/usecase_output.dart';

abstract class FirebaseDataSource {
  /// [Get todos]
  Future<GetTodosUsecaseOutput> getTodos(GetTodosUsecaseInput input);

  /// [Update todo]
  Future<UpdateTodoUsecaseOutput> updateTodo(UpdateTodoUsecaseInput input);

  /// [add todo]
  Future<AddTodoUsecaseOutput> addTodo(AddTodoUsecaseInput input);
}
