import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/database/todo_database.dart';
import 'package:todo_app/models/task.dart';

class Tasks with ChangeNotifier {
  List<Task> taskList;
  Future<List<Task>> getTasks() async {
    final tasks = await ToDoDatabase.db.getTasks();
    taskList = tasks;
    return tasks;
  }

  void addTask(String title, String details, DateTime startDate,
      DateTime endDate, String category) {
    Task task = new Task(
        id: taskList.length + 1,
        title: title,
        details: details,
        taskDate: startDate,
        endDate: endDate,
        category: category);

    ToDoDatabase.db.add(task).then((id) => notifyListeners());
  }

  void editTask(Task task) {
    ToDoDatabase.db.update(task).then((id) => notifyListeners());
  }

  /*Future<Task> getTaskById(int id) async {
    return await ToDoDatabase.db.getTaskById(id);
  }*/

  Task getById(int id) {
    return taskList.firstWhere((task) => task.id == id);
  }
}
