import 'package:flutter/material.dart';
import 'package:todo_app/business_logic/enums/todo_mode.dart';
import 'package:todo_app/business_logic/models/constants.dart';
import 'package:todo_app/business_logic/models/task.dart';

class FormViewModel with ChangeNotifier {
  int _selectedCateogryIndex;
  bool _isCalendarView;
  Task _task;
  TodoMode _mode;

  FormViewModel(Task loadedTask) {
    if (loadedTask != null) {
      _mode = TodoMode.edit;
      _task = loadedTask;
      _selectedCateogryIndex = categories.indexOf(_task.category);
    } else {
      _mode = TodoMode.add;
      _task = new Task();
      _selectedCateogryIndex = 0;
    }
    _isCalendarView = true;
    notifyListeners();
  }

  int get selectedCateogryIndex => _selectedCateogryIndex;
  bool get isCalendarView => _isCalendarView;
  Task get task => _task;
  TodoMode get mode => _mode;

  void changeCalendarView() {
    _isCalendarView = !_isCalendarView;
    notifyListeners();
  }

  void updateDate(DateTime start, DateTime end) {
    _task.taskDate = start;
    _task.endDate = end;
    notifyListeners();
  }

  void updateCategory(String value) {
    _task.category = value;
    notifyListeners();
  }

  void updateTitleAndDetailS(String title, String details) {
    _task.title = title;
    _task.details = details;
    notifyListeners();
  }

  set selectedCateogryIndex(int value) {
    this._selectedCateogryIndex = value;
    notifyListeners();
  }
}
