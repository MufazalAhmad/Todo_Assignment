import 'package:injectable/injectable.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/domain/repository/todo_repository.dart';
import 'package:todo_assignment/infrastructure/usecase.dart';
import 'package:todo_assignment/infrastructure/usecase_input.dart';
import 'package:todo_assignment/infrastructure/usecase_output.dart';

class UpdateTodoUsecaseInput extends Input {
  final TodoModel todo;
  UpdateTodoUsecaseInput({required this.todo});
}

class UpdateTodoUsecaseOutput extends Output {}

@lazySingleton
class UpdateTodoUsecase
    extends Usecase<UpdateTodoUsecaseOutput, UpdateTodoUsecaseInput> {
  final TodoRepository _todoRepository;

  UpdateTodoUsecase({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<UpdateTodoUsecaseOutput> call(UpdateTodoUsecaseInput input) {
    return _todoRepository.updateTodo(input);
  }
}
