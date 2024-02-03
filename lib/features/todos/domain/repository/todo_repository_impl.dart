import 'package:injectable/injectable.dart';
import 'package:todo_assignment/features/todos/datasource/firebase/firebase_datasource.dart';
import 'package:todo_assignment/features/todos/domain/repository/todo_repository.dart';
import 'package:todo_assignment/features/todos/domain/usecase/add_todo_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/get_todos_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/update_todo_usecase.dart';
import 'package:todo_assignment/infrastructure/usecase_input.dart';
import 'package:todo_assignment/infrastructure/usecase_output.dart';

@Singleton(as: TodoRepository)
class TodoRepositoryImpl extends TodoRepository {
  final FirebaseDataSource firebaseDataSource;
  TodoRepositoryImpl({required this.firebaseDataSource});

  @override
  Future<AddTodoUsecaseOutput> addTodo(AddTodoUsecaseInput input) async {
    return firebaseDataSource.addTodo(input);
  }

  @override
  Future<GetTodosUsecaseOutput> getTodos(GetTodosUsecaseInput input) {
    return firebaseDataSource.getTodos(input);
  }

  @override
  Future<UpdateTodoUsecaseOutput> updateTodo(UpdateTodoUsecaseInput input) {
    return firebaseDataSource.updateTodo(input);
  }
}
