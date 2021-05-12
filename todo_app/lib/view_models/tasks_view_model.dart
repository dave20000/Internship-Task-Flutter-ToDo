import 'package:flutter/material.dart';
import 'package:todo_app/database/todo_database.dart';
import 'package:todo_app/models/task.dart';

class TasksViewModel with ChangeNotifier {
  List<Task> taskList = [];

  TasksViewModel() {
    getTasks();
  }

  Future<void> getTasks() async {
    final tasks = await ToDoDatabase.db.getTasks();
    taskList = tasks;
    notifyListeners();
  }

  void addTask(Task task) {
    task.id = taskList.length + 1;
    ToDoDatabase.db.add(task).then((id) {
      taskList.add(task);
      notifyListeners();
    });
  }

  void editTask(Task task) {
    ToDoDatabase.db.update(task).then((id) {
      taskList[taskList.indexWhere((element) => element.id == task.id)] = task;
      notifyListeners();
    });
  }

  Task getById(int id) {
    return taskList.firstWhere((task) => task.id == id);
  }
}
