import 'package:todo_app_xp/data/repositories/todo_repository.dart';
import 'package:todo_app_xp/domain/entities/todo.dart';

class EditTodoUsecase {
  Future<bool> call(Todo todo) async {
    return await TodoRepository().edit(todo: todo);
  }
}