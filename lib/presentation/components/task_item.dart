import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:todo_app_xp/domain/entities/todo.dart";

class TaskItem extends StatelessWidget {
  final Todo todo;

  const TaskItem({super.key, required this.todo});

  String get formattedDate {
    DateTime dateTime = DateTime.parse(todo.date);
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  // Getter para obter o horário formatado
  String get formattedTime {
    DateTime dateTime = DateTime.parse(todo.date);
    return DateFormat("HH:mm").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(68, 137, 145, 145),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: todo.completed ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: todo.completed ? Colors.green : const Color.fromARGB(189, 0, 0, 0),
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10),
                Text(todo.description,
                    style: const TextStyle(
                      color: Color.fromARGB(189, 0, 0, 0),
                      fontSize: 14,
                    )),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text(formattedDate),
            Text(formattedTime)
          ],)
        ],
      ),
    );
  }
}