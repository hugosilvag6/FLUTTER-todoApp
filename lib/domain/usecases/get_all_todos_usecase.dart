import 'package:todo_app_xp/data/repositories/todo_repository.dart';
import 'package:todo_app_xp/domain/entities/todo.dart';

class GetAllTodosUsecase {
  Future<List<Todo>> call() async {
    return await TodoRepository().getAll();
  }
}