import 'package:todo_app_xp/domain/entities/todo.dart';
import 'package:todo_app_xp/external/consumer/firebase.dart';

class TodoRepository {
  Future<Todo> create({required Todo todo}) async { 
    final newTodo = await FirebaseConsumer.create(todo.toMap());
    return Todo.fromMap(newTodo); 
  }
  Future<List<Todo>> getAll() async { 
    final list = await FirebaseConsumer.getAll();
    return list.map((e) => Todo.fromMap(e)).toList(); 
  }
  Future<bool> edit({required Todo todo}) async { 
    return await FirebaseConsumer.edit(todo.toMap()); 
  }
  Future<Todo> delete({required Todo todo}) async {
    return await FirebaseConsumer.delete(todo);
  }
}