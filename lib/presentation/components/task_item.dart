import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:todo_app_xp/domain/entities/todo.dart";
import "package:todo_app_xp/domain/usecases/edit_todo_usecase.dart";

class TaskItem extends StatelessWidget {
  void Function(Todo todo) editTodo;
  void Function(Todo todo) deleteTodo;
  final Todo todo;

  TaskItem(
      {super.key,
      required this.todo,
      required this.editTodo,
      required this.deleteTodo});

  String get formattedDate {
    DateTime dateTime = DateTime.parse(todo.date);
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  String get formattedTime {
    DateTime dateTime = DateTime.parse(todo.date);
    return DateFormat("HH:mm").format(dateTime);
  }

  Color get textColor {
    return todo.completed
        ? const Color.fromARGB(50, 0, 0, 0)
        : const Color.fromARGB(150, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          editTodo(todo);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(68, 137, 145, 145),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: todo.completed ? Colors.green : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: todo.completed
                        ? Colors.green
                        : const Color.fromARGB(189, 0, 0, 0),
                    width: 2,
                  ),
                ),
                child: todo.completed
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      )
                    : null,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todo.title,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(todo.description,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formattedDate,
                    style: TextStyle(color: textColor),
                  ),
                  Text(
                    formattedTime,
                    style: TextStyle(color: textColor),
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  deleteTodo(todo);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 137, 145, 145),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 255, 17, 0),
                    size: 25,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
