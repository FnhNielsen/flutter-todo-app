class Task {
  String? id;
  String? task;
  bool isDone;

  Task({
    required this.id,
    required this.task,
    this.isDone = false,
  });

  static List<Task> todoList() {
    return [
      Task(id: '1', task: 'Make todo app in Flutter', isDone: true ),
      Task(id: '2', task: 'Run 10 km', isDone: true ),
      Task(id: '3', task: 'Cook dinner for girlfriend', isDone: false ),
      Task(id: '4', task: 'Read for 30 minutes', isDone: true),
      Task(id: '5', task: 'Steal christmas', isDone: false)
    ];
  }
}