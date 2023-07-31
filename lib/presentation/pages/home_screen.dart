import "package:flutter/material.dart";
import 'package:todo_app_xp/domain/entities/todo.dart';
import 'package:todo_app_xp/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_app_xp/domain/usecases/edit_todo_usecase.dart';
import 'package:todo_app_xp/domain/usecases/get_all_todos_usecase.dart';

import 'package:todo_app_xp/presentation/components/task_item.dart';
import 'package:todo_app_xp/presentation/pages/new_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getAll = GetAllTodosUsecase();
  final delete = DeleteTodoUsecase();
  final edit = EditTodoUsecase();
  List<Todo> taskList = [];

  Future<void> editTodo(Todo todo) async {
    setState(() {
      edit(todo);
    });
  }

  Future<void> deleteTodo(Todo todo) async {
    final deletedTodo = await delete(todo);
    setState(() {
      taskList.removeWhere((e) => e.id == deletedTodo.id);
    });
  }

  Future<void> getTaskList() async {
    var list = await getAll();
    setState(() {
      taskList = list;
    });
  }

  void addTodo(Todo? todo) {
    if (todo != null) {
      setState(() {
        taskList.add(todo);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        actions: [
          TextButton(
            onPressed: () async {
              final todo = await Navigator.push<Todo>(
                context,
                MaterialPageRoute(builder: (context) => const NewTaskScreen()),
              );
              addTodo(todo);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...taskList
              .map((e) => TaskItem(todo: e, editTodo: editTodo, deleteTodo: deleteTodo))
              .toList()
        ],
      ),
    );
  }
}
