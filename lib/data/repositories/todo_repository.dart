import 'package:todo_app_xp/domain/entities/todo.dart';
import 'package:todo_app_xp/external/consumer/firebase.dart';

class TodoRepository {
  Future<bool> create({required Todo todo}) async { 
    return await FirebaseConsumer.create(todo.toMap()); 
  }
  Future<List<Todo>> getAll() async { 
    final list = await FirebaseConsumer.getAll();
    return list.map((e) => Todo.fromMap(e)).toList(); 
  }
  Future<bool> edit({required Todo todo}) async { 
    return await FirebaseConsumer.edit(todo.toMap()); 
  }
}