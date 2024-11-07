import 'task.dart';

class Todos {
  final List<Task> _taskList = [];

  void addTask(String title) {
    int id = _taskList.length + 1;
    Task task = Task(id: id, title: title, isCompleted: false);
    _taskList.add(task);
  }

  Task? getTask(int id) {
    Task task = _taskList.firstWhere((Task task) => task.id == id,
        orElse: () => Task(id: -1, title: 'Not found'));
    if (task.id == -1) {
      print('Task not found with ID: $id');
      return null;
    } else {
      return task;
    }
  }

  void deleteTask(int id) {
    int index = _taskList.indexWhere((Task task) => task.id == id);
    if (index == -1) {
      print('Task with ID $id not found');
    }
  }

  void viewTodos() {
    if (_taskList.isEmpty) {
      print('No tasks found 🥺');
      return;
    }
    print('Current Todos:');
    for (Task task in _taskList) {
      print(task);
    }
    print('');
  }

  updateTask(int taskId, String title) {
    int indexWhere = _taskList.indexWhere((Task task) {
      return task.id == taskId;
    });
    if (indexWhere < 0) {
      print('Task with ID $taskId not found');
    } else {
      Task task = _taskList[indexWhere];
      task.title = title;
      print(task);
    }
  }

  void markTaskAsCompleted(int taskId) {
    int indexWhere = _taskList.indexWhere((Task task) {
      return task.id == taskId;
    });
    if (indexWhere < 0) {
      print('Task with ID $taskId not found');
    } else {
      Task task = _taskList[indexWhere];
      task.isCompleted = true;
      print(task);
    }
  }
}
