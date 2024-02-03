import 'package:injectable/injectable.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/domain/repository/todo_repository.dart';
import 'package:todo_assignment/infrastructure/usecase.dart';
import 'package:todo_assignment/infrastructure/usecase_input.dart';
import 'package:todo_assignment/infrastructure/usecase_output.dart';

class DeleteTodoUsecaseInput extends Input {
  final String id;
  DeleteTodoUsecaseInput({required this.id});
}

class DeleteTodoUsecaseOutput extends Output {}

@lazySingleton
class DeleteTodoUsecase
    extends Usecase<DeleteTodoUsecaseOutput, DeleteTodoUsecaseInput> {
  final TodoRepository _todoRepository;

  DeleteTodoUsecase({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<DeleteTodoUsecaseOutput> call(input) {
    return _todoRepository.deleteTodo(input);
  }
}
