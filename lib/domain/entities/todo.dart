class Todo {
  final String id;
  final String title;
  final String description;
  final String date;
  final bool notify;
  bool completed;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      this.notify = false,
      this.completed = false});

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        id: map["id"],
        title: map["title"],
        description: map["description"],
        date: map["date"],
        notify: map["notify"],
        completed: map["completed"]);
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "notify": notify,
      "completed": completed
    };
  }
}
