import 'package:todo_app_xp/data/repositories/todo_repository.dart';
import 'package:todo_app_xp/domain/entities/todo.dart';

class CreateTodoUsecase {
  Future<Todo> call(Todo todo) async {
    return await TodoRepository().create(todo: todo);
  }
}