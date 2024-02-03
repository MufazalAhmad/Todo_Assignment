import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    required this.todo,
    super.key,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        children: [
          SizedBox(width: 20.w),

          SizedBox(width: 20.w),

          /// [title]
          Text(
            todo.title,
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),

          const Spacer(),

          /// [Complete button]
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),

          SizedBox(width: 20.w),
        ],
      ),
    );
  }
}
