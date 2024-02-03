import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_assignment/features/todos/domain/models/todo.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    required this.todo,
    required this.index,
    required this.onDelete,
    super.key,
  });

  final TodoModel todo;
  final int index;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 20.w),

          /// [Sr.No]
          Text(
            '${index.toString()})',
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(width: 20.w),

          /// [title]
          Expanded(
            child: Text(
              todo.title,
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),

          SizedBox(width: 20.w),

          /// [Delete button]
          InkWell(
            onTap: onDelete,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                'Delete',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),

          SizedBox(width: 20.w),
        ],
      ),
    );
  }
}
