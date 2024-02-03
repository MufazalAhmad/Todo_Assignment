import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/presentation/providers/add_todo_provider.dart';
import 'package:todo_assignment/features/todos/presentation/providers/get_todos_list_provider.dart';
import 'package:todo_assignment/features/todos/presentation/views/Todos_list_view/popups/add_task_popup.dart';
import 'package:todo_assignment/features/todos/presentation/views/Todos_list_view/widgets/todos_list_widget.dart';

class TodosView extends ConsumerWidget {
  const TodosView({super.key});

  /// [Add Todo]
  Future<void> addTodo(BuildContext context, WidgetRef ref) async {
    try {
      final todosAsync = ref.read(getTodosList);
      final todoListLength = todosAsync.value?.length ?? 0;

      if (todoListLength < 10) {
        await showDialog(
          context: context,
          builder: (context) => const AddTaskDialog(),
        );
      } else {
        Fluttertoast.showToast(
            msg: 'Buy Pro Version" and "Remove first todo item.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await addTodo(context, ref);
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              SizedBox(height: 20.h),

              /// [title]
              Text(
                'Todos',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30.h),

              /// [Todo list]
              const TodoListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
