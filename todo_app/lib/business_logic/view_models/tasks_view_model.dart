import 'package:flutter/material.dart';
import 'package:todo_app/services/database/database_service.dart';
import 'package:todo_app/business_logic/models/task.dart';
import 'package:todo_app/services/service_locator.dart';

class TasksViewModel with ChangeNotifier {
  final databaseService = ServiceLocator.resolve<DatabaseService>();
  List<Task> taskList = [];

  TasksViewModel() {
    getTasks();
  }

  Future<void> getTasks() async {
    final tasks = await databaseService.getTasks();
    taskList = tasks;
    notifyListeners();
  }

  void addTask(Task task) {
    task.id = taskList.length + 1;
    databaseService.add(task).then((id) {
      taskList.add(task);
      notifyListeners();
    });
  }

  void editTask(Task task) {
    databaseService.update(task).then((id) {
      taskList[taskList.indexWhere((element) => element.id == task.id)] = task;
      notifyListeners();
    });
  }

  Task getById(int id) {
    return taskList.firstWhere((task) => task.id == id);
  }
}
