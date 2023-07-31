import "package:flutter/material.dart";
import 'package:todo_app_xp/domain/entities/todo.dart';
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
  List<Widget> taskList = [];

  Future<void> getTaskList() async {
    var list = await getAll();
    setState(() {
      taskList = list.map((e) => TaskItem(todo: e)).toList();
    });
  }

  void addTodo(Todo? todo) {
    if (todo != null) {
      setState(() {
        taskList.add(TaskItem(todo: todo));
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
        children: [...taskList],
      ),
    );
  }
}
