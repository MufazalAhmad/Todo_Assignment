import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_assignment/features/todos/datasource/firebase/firebase_datasource.dart';
import 'package:todo_assignment/features/todos/domain/usecase/add_todo_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/get_todos_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/update_todo_usecase.dart';

const String _todoCollection = 'todos';

@Singleton(as: FirebaseDataSource)
class FirebaseDataSourceImpl extends FirebaseDataSource {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<AddTodoUsecaseOutput> addTodo(AddTodoUsecaseInput input) async {
    try {
      await _fireStore.collection(_todoCollection).add(input.todo.toJson());
      return AddTodoUsecaseOutput();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpdateTodoUsecaseOutput> updateTodo(UpdateTodoUsecaseInput input) {
    throw UnimplementedError();
  }

  @override
  Future<GetTodosUsecaseOutput> getTodos(GetTodosUsecaseInput input) {
    // TODO: implement getTodos
    throw UnimplementedError();
  }
}
