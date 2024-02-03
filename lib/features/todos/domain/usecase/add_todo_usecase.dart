import 'package:injectable/injectable.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/domain/repository/todo_repository.dart';
import 'package:todo_assignment/infrastructure/usecase.dart';
import 'package:todo_assignment/infrastructure/usecase_input.dart';
import 'package:todo_assignment/infrastructure/usecase_output.dart';

class AddTodoUsecaseInput extends Input {
  final TodoModel todo;
  AddTodoUsecaseInput({required this.todo});
}

class AddTodoUsecaseOutput extends Output {}

@lazySingleton
class AddTodoUsecase
    extends Usecase<AddTodoUsecaseOutput, AddTodoUsecaseInput> {
  final TodoRepository _todoRepository;

  AddTodoUsecase({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<AddTodoUsecaseOutput> call(input) {
    return _todoRepository.addTodo(input);
  }
}
