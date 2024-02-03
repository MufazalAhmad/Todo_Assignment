import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/presentation/providers/add_todo_provider.dart';

class AddTaskDialog extends ConsumerStatefulWidget {
  const AddTaskDialog({super.key});

  @override
  ConsumerState<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends ConsumerState<AddTaskDialog> {
  final _textEditingController = TextEditingController();

  Future<void> addTodo() async {
    try {
      final taskTitle = _textEditingController.text;
      ref.read(addTodoProvider(taskTitle).future);
      Navigator.of(context).pop();
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: TextField(
        controller: _textEditingController,
        decoration: const InputDecoration(
          labelText: 'Task Title',
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            addTodo();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
