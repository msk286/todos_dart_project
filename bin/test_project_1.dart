import 'dart:io';

import 'models/todos.dart';

void main() async {
  Todos todos = Todos();

  print('Welcome in Todos App!');

  bool isWorking = true;

  while (isWorking) {
    print('Please select an option');
    print('1. Add a new task');
    print('2. View all tasks');
    print('3. Mark a task as completed');
    print('4. Update task title');
    print('5. Exit');
    stdout.write('Enter your option (1 -4):');

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
        String? taskIdString = stdin.readLineSync();
        int taskId = int.tryParse(taskIdString ?? '') ?? 0;
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
