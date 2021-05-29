import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/services/database/database_contract.dart';

class TaskViewModel with ChangeNotifier {
  int _selectedCateogryIndex;
  bool isCalendarView;
  Task task;
  bool isAdd;
  DatabaseContract _databaseContract;

  TaskViewModel(this._databaseContract);

  Future<void> addTask() async {
    await _databaseContract.add(task);
  }

  Future<void> editTask() async {
    await _databaseContract.update(task);
  }

  Future<void> getById(int id) async {
    final newTask = await _databaseContract.getTaskById(id);
    task = newTask;
    notifyListeners();
  }

  int get selectedCateogryIndex => _selectedCateogryIndex;

  void changeCalendarView() {
    isCalendarView = !isCalendarView;
    notifyListeners();
  }

  void updateDate(DateTime start, DateTime end) {
    task.taskDate = start;
    task.endDate = end;
    notifyListeners();
  }

  void updateCategory(String value) {
    task.category = value;
    notifyListeners();
  }

  void updateTitleAndDetailS(String title, String details) {
    task.title = title;
    task.details = details;
    notifyListeners();
  }

  set selectedCateogryIndex(int value) {
    this._selectedCateogryIndex = value;
    notifyListeners();
  }
}
