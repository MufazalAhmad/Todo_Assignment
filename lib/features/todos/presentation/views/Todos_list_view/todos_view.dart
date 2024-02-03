import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';
import 'package:todo_assignment/features/todos/presentation/providers/add_todo_provider.dart';

class TodosView extends ConsumerWidget {
  const TodosView({super.key});

  /// [Add Todo]
  Future<void> addTodo(WidgetRef ref) async {
    try {
      final todo = TodoModel(
        id: 1,
        title: 'Break fast',
        isCompleted: false,
      );
      await ref.read(addTodoProvider(todo).future);
    } catch (e) {
      //Todo:
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await addTodo(ref);
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
                'Employees',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              /// [title]
              Text(
                'Employees',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  await addTodo(ref);
                },
                child: Text(
                  'Employees',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30.h),

              /// [Todo list]
              //   const TodoListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
