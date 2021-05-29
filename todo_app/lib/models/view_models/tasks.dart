import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/services/database/database_contract.dart';

class TasksViewModel with ChangeNotifier {
  final DatabaseContract _databaseContract;
  Future<List<Task>> _taskList;
  Future<List<Task>> get taskList => _taskList;

  TasksViewModel(this._databaseContract);

  Future<void> fetchTasks() async {
    _taskList = _databaseContract.getTasks();
  }

  Future<void> refreshTasks() async {
    _taskList = _databaseContract.getTasks();
    notifyListeners();
    await _taskList;
  }

  /*Task getById(int id) {
    return _taskList.firstWhere((task) => task.id == id);
  }*/
  /*
  Future<void> addTask(Task task) async {
    await _databaseContract.add(task);
  }

  Future<void> editTask(Task task) async {
    await _databaseContract.update(task);
  }
  */
}
