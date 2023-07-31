import 'package:flutter/material.dart';
import 'package:todo_app_xp/domain/entities/todo.dart';
import 'package:todo_app_xp/domain/usecases/create_todo_usecase.dart';
import 'package:uuid/uuid.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final title = TextEditingController();
  final description = TextEditingController();
  final selectedDate = TextEditingController();
  bool notify = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      final TimeOfDay? pickedTime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (pickedTime != null && pickedTime != TimeOfDay.now()) {
        setState(() {
          selectedDate.text = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          ).toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova tarefa"),
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Nome da tarefa")),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: description,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Descrição da tarefa"),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: selectedDate,
              onTap: () {
                _selectDate(context);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Data"),
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Text("Receber notificação?"),
                ),
                Switch(
                  value: notify,
                  onChanged: (value) {
                    setState(() {
                      notify = value;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final todo = Todo(
                  id: const Uuid().v4(),
                  title: title.text,
                  description: description.text,
                  date: selectedDate.text,
                  notify: notify,
                );
                final newTodo = await CreateTodoUsecase().call(todo);
                Navigator.pop(context, newTodo);
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
