import 'task.dart';

class Todos {
  List<Task> taskList = [];

  void addTask(String title) {
    int id = taskList.length + 1;
    Task task = Task(id: id, title: title, isCompleted: false);
    taskList.add(task);
  }

  Task getTask(int index) {
    return taskList[index];
  }

  Task deleteTask(int index) {
    return taskList.removeAt(index);
  }

  viewTodos() {
    if (taskList.isEmpty) {
      print('No tasks found 🥺');
      return;
    }
    print('Current Todos:');
    for (Task task in taskList) {
      print(task);
    }
    print('');
  }

  updateTask(int taskId, String title) {
    int indexWhere = taskList.indexWhere((Task task) {
      return task.id == taskId;
    });
    if (indexWhere < 0) {
      print('Task with ID $taskId not found');
    } else {
      Task task = taskList[indexWhere];
      task.title = title;
      print(task);
    }
  }

  void markTaskAsCompleted(int taskId) {
    int indexWhere = taskList.indexWhere((Task task) {
      return task.id == taskId;
    });
    if (indexWhere < 0) {
      print('Task with ID $taskId not found');
    } else {
      Task task = taskList[indexWhere];
      task.isCompleted = true;
      print(task);
    }
  }
}
