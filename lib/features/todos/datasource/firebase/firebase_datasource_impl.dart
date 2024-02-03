import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_assignment/features/todos/datasource/entities/todo_entity.dart';
import 'package:todo_assignment/features/todos/datasource/firebase/firebase_datasource.dart';
import 'package:todo_assignment/features/todos/domain/usecase/add_todo_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/delete_todo_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/get_todos_usecase.dart';
import 'package:todo_assignment/features/todos/domain/usecase/update_todo_usecase.dart';

const String _todoCollection = 'todos';

@Singleton(as: FirebaseDataSource)
class FirebaseDataSourceImpl extends FirebaseDataSource {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<AddTodoUsecaseOutput> addTodo(AddTodoUsecaseInput input) async {
    try {
      await _fireStore.collection(_todoCollection).add({
        'title': input.taskTitle,
        'isCompleted': false,
      });
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
  GetTodosUsecaseOutput getTodos(GetTodosUsecaseInput input) {
    final collectionRef = _fireStore.collection(_todoCollection).withConverter(
          fromFirestore: (snapshot, _) {
            final id = snapshot.id;

            var json = snapshot.data();
            json?['id'] = id;
            return TodoEntity.fromJson(json as Map<String, dynamic>);
          },
          toFirestore: (chat, _) => {},
        );

    final todos = collectionRef.snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();
      },
    );
    return GetTodosUsecaseOutput(todos: todos);
  }

  @override
  Future<DeleteTodoUsecaseOutput> deleteTodo(
      DeleteTodoUsecaseInput input) async {
    try {
      await _fireStore.collection(_todoCollection).doc(input.id).delete();
      return DeleteTodoUsecaseOutput();
    } catch (e) {
      rethrow;
    }
  }
}
