import 'dart:io';

import 'models/todos.dart';

void main() async {
  const List<String> listOfMessages = [
    'Add a new task',
    'View all tasks',
    'Mark a task as completed',
    'Update task title',
    'Exit',
  ];

  void printInitMessagesMap() {
    print('Please select an option');
    for (int i = 0; i < listOfMessages.length; ++i) {
      String msg = listOfMessages[i];
      print('${i + 1}. $msg');
    }
  }

  Todos todos = Todos();

  print('Welcome in Todos App!');

  bool isWorking = true;

  while (isWorking) {
    printInitMessagesMap();
    stdout.write('Enter your option (1 -${listOfMessages.length}):');

    String? option = stdin.readLineSync();
    print('');
    print('');
    print('');
    switch (option) {
      case '1':
        stdout.write('Enter a task title: ');
        String? taskTitle = stdin.readLineSync();
        if (taskTitle != null) {
          todos.addTask(taskTitle);
        }
        break;
      case '2':
        todos.viewTodos();
        break;
      case '3':
        stdout.write('Enter a task ID: ');
        String taskIdString = stdin.readLineSync() ?? '';
        int taskId = int.tryParse(taskIdString) ?? 0;
        if (taskId != 0) {
          todos.markTaskAsCompleted(taskId);
        }
        break;
      case '4':
        stdout.write('Enter a task ID: ');
        String? taskIdString = stdin.readLineSync();
        int taskId = int.tryParse(taskIdString ?? '') ?? 0;
        stdout.write('Enter a new title: ');
        String? newTitle = stdin.readLineSync();
        if (taskId != 0 && newTitle != null) {
          todos.updateTask(taskId, newTitle);
        }
        break;
      case '5':
        isWorking = false;
        break;
    }
  }
}
