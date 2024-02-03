import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_assignment/features/todos/presentation/views/Todos_list_view/widgets/todo_tile_widget.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final todosAsync = ref.watch(getTodosList);

    // if (todosAsync.isLoading) {
    //   return Center(
    //     child: SizedBox(
    //       height: 20.h,
    //       width: 20.w,
    //       child: const CircularProgressIndicator(),
    //     ),
    //   );
    // } else if (todosAsync.hasError) {
    //   return Center(
    //     child: SizedBox(
    //       height: 20.h,
    //       width: 20.w,
    //       child: const Text('Something went wrong'),
    //     ),
    //   );
    // }

    final todos = []; // todosAsync.value ?? [];

    return Expanded(
      child: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final employee = todos[index];
          return TodoTileWidget(
            todo: employee,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 5.h);
        },
      ),
    );
  }
}
