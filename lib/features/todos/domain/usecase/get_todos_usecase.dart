import 'package:injectable/injectable.dart';
import 'package:todo_assignment/features/todos/datasource/entities/todo_entity.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/domain/repository/todo_repository.dart';
import 'package:todo_assignment/infrastructure/usecase.dart';
import 'package:todo_assignment/infrastructure/usecase_input.dart';
import 'package:todo_assignment/infrastructure/usecase_output.dart';

class GetTodosUsecaseInput extends Input {}

class GetTodosUsecaseOutput extends Output {
  final Stream<List<TodoModel>> _todos;

  GetTodosUsecaseOutput({required Stream<List<TodoEntity>> todos})
      : _todos = todos.map((List<TodoEntity> entities) {
          return entities
              .map((entity) => TodoModel.formEntity(entity))
              .toList();
        });

  Stream<List<TodoModel>> get todos => _todos;
}

@lazySingleton
class GetTodosUsecase {
  final TodoRepository _todoRepository;

  GetTodosUsecase({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  GetTodosUsecaseOutput call(GetTodosUsecaseInput input) {
    return _todoRepository.getTodos(input);
  }
}
