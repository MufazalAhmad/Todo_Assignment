import 'package:go_router/go_router.dart';
import 'package:todo_assignment/features/todos/presentation/views/Todos_list_view/todos_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const TodosView();
      },
    ),
  ],
);
