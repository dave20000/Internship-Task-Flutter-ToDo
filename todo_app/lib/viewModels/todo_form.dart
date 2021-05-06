import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:intl/intl.dart';

class ToDoFormViewModel with ChangeNotifier {
  String _month;
  String _year;

  final List<String> categories = [
    'Work',
    'Fun',
    'Sport',
    'Study',
    'Family',
    'Birth'
  ];

  TextEditingController _titleController;
  TextEditingController _detailsController;

  String _category;
  List<Color> _colors = [
    Colors.yellowAccent[700],
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  DateTime _startDate;
  DateTime _endDate;
  bool _isCalendarView = true;

  Task loadedTask;

  ToDoFormViewModel(Task task) {
    loadedTask = task;
    if (task != null) {
      _titleController = TextEditingController(text: loadedTask.title);
      _detailsController = TextEditingController(text: loadedTask.details);
      _category = loadedTask.category;
      _startDate = loadedTask.taskDate;
      _endDate = loadedTask.endDate;
      for (int i = 0; i < categories.length; i++) {
        if (categories[i] == loadedTask.category) {
          _colors[i] = Colors.yellowAccent[700];
        } else {
          _colors[i] = Colors.white;
        }
      }
      _month = DateFormat('MMM').format(loadedTask.taskDate);
      _year = loadedTask.taskDate.year.toString();
    } else {
      _titleController = TextEditingController();
      _detailsController = TextEditingController();
      _month = DateFormat('MMM').format(DateTime.now());
      _year = DateTime.now().year.toString();
      _category = categories[0];
    }
    notifyListeners();
  }

  String get category {
    return _category;
  }

  List<Color> get colors {
    return _colors;
  }

  DateTime get startDate {
    return _startDate;
  }

  DateTime get endDate {
    return _endDate;
  }

  bool get isCalendarView {
    return _isCalendarView;
  }

  void updateCategory(String newCategory) {
    _category = newCategory;
    notifyListeners();
  }

  void updateColor(int index) {
    for (int i = 0; i < _colors.length; i++) {
      if (i == index) {
        _colors[i] = Colors.yellowAccent[700];
      } else {
        _colors[i] = Colors.white;
      }
    }
    notifyListeners();
  }

  void updateDates(DateTime start, DateTime end) {
    _startDate = start;
    _endDate = end;
    notifyListeners();
  }

  void changeCalendarView() {
    _isCalendarView = !_isCalendarView;
    notifyListeners();
  }

  TextEditingController get titleController => this._titleController;

  set titleController(TextEditingController value) {
    this._titleController = value;
    notifyListeners();
  }

  TextEditingController get detailsController => this._detailsController;

  set detailsController(TextEditingController value) {
    this._detailsController = value;
    notifyListeners();
  }

  String get month {
    return _month;
  }

  String get year {
    return _year;
  }

  set startDate(DateTime value) {
    _startDate = value;
    notifyListeners();
  }

  set endDate(DateTime value) {
    _endDate = value;
    notifyListeners();
  }
}
