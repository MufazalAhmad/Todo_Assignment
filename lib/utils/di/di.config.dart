// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/todos/datasource/firebase/firebase_datasource.dart'
    as _i3;
import '../../features/todos/datasource/firebase/firebase_datasource_impl.dart'
    as _i4;
import '../../features/todos/domain/repository/todo_repository.dart' as _i5;
import '../../features/todos/domain/repository/todo_repository_impl.dart'
    as _i6;
import '../../features/todos/domain/usecase/add_todo_usecase.dart' as _i8;
import '../../features/todos/domain/usecase/get_todos_usecase.dart' as _i9;
import '../../features/todos/domain/usecase/update_todo_usecase.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.FirebaseDataSource>(_i4.FirebaseDataSourceImpl());
    gh.singleton<_i5.TodoRepository>(_i6.TodoRepositoryImpl(
        firebaseDataSource: gh<_i3.FirebaseDataSource>()));
    gh.lazySingleton<_i7.UpdateTodoUsecase>(
        () => _i7.UpdateTodoUsecase(todoRepository: gh<_i5.TodoRepository>()));
    gh.lazySingleton<_i8.AddTodoUsecase>(
        () => _i8.AddTodoUsecase(todoRepository: gh<_i5.TodoRepository>()));
    gh.lazySingleton<_i9.GetTodosUsecase>(
        () => _i9.GetTodosUsecase(todoRepository: gh<_i5.TodoRepository>()));
    return this;
  }
}
