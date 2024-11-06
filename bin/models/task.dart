class Task {
  int id;
  String title;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  @override
  toString() {
    return 'Task: [$id], title: $title, ${isCompleted ? ' [✅]' : '[ ]'}';
  }
}
