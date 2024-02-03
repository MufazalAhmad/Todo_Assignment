import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_assignment/features/todos/presentation/providers/delete_todo_provider.dart';
import 'package:todo_assignment/features/todos/presentation/providers/get_todos_list_provider.dart';
import 'package:todo_assignment/features/todos/presentation/views/Todos_list_view/widgets/todo_tile_widget.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({super.key});

  Future<void> onDelete(WidgetRef ref, String id) async {
    try {
      await ref.read(deleteTodoProvider(id).future);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(getTodosList);

    if (todosAsync.isLoading) {
      return Center(
        child: SizedBox(
          height: 20.h,
          width: 20.w,
          child: const CircularProgressIndicator(),
        ),
      );
    } else if (todosAsync.hasError) {
      return Center(
        child: SizedBox(
          height: 20.h,
          child: const Text('Something went wrong'),
        ),
      );
    }

    final todos = todosAsync.value ?? [];

    return Expanded(
      child: todos.isEmpty
          ? Center(
              child: Text(
                "You have not task yet!",
                style: TextStyle(fontSize: 18.sp),
              ),
            )
          : ListView.separated(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return TodoTileWidget(
                  todo: todo,
                  index: index + 1,
                  onDelete: () => onDelete(ref, todo.id),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5.h);
              },
            ),
    );
  }
}
