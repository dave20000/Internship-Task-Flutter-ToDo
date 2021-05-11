import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:intl/intl.dart';

class ToDoFormViewModel with ChangeNotifier {
  int _selectedEventIndex;
  String _month;
  String _year;
  TextEditingController _titleController;
  TextEditingController _detailsController;
  String _category;
  DateTime _startDate;
  DateTime _endDate;
  bool _isCalendarView = true;
  Task _task;

  final List<String> categories = [
    'Work',
    'Fun',
    'Sport',
    'Study',
    'Family',
    'Birth'
  ];

  ToDoFormViewModel(Task loadedTask) {
    if (loadedTask != null) {
      _task = loadedTask;
      _titleController = TextEditingController(text: _task.title);
      _detailsController = TextEditingController(text: _task.details);
      _category = _task.category;
      _startDate = _task.taskDate;
      _endDate = _task.endDate;
      _month = DateFormat('MMM').format(_task.taskDate);
      _year = _task.taskDate.year.toString();
      for (int i = 0; i < categories.length; i++) {
        if (categories[i] == _task.category) {
          _selectedEventIndex = i;
        }
      }
    } else {
      _titleController = TextEditingController();
      _detailsController = TextEditingController();
      _month = DateFormat('MMM').format(DateTime.now());
      _year = DateTime.now().year.toString();
      _category = categories[0];
      _selectedEventIndex = 0;
    }
    notifyListeners();
  }

  int get selectedEventIndex => _selectedEventIndex;
  String get category => _category;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;
  bool get isCalendarView => _isCalendarView;
  String get month => _month;
  String get year => _year;
  TextEditingController get titleController => this._titleController;
  TextEditingController get detailsController => this._detailsController;
  Task get task => _task;

  void updateDates(DateTime start, DateTime end) {
    _startDate = start;
    _endDate = end;
    notifyListeners();
  }

  void changeCalendarView() {
    _isCalendarView = !_isCalendarView;
    notifyListeners();
  }

  set titleController(TextEditingController value) {
    this._titleController = value;
    notifyListeners();
  }

  set detailsController(TextEditingController value) {
    this._detailsController = value;
    notifyListeners();
  }

  set startDate(DateTime value) {
    _startDate = value;
    notifyListeners();
  }

  set endDate(DateTime value) {
    _endDate = value;
    notifyListeners();
  }

  set category(String newValue) {
    _category = newValue;
    notifyListeners();
  }

  set selectedEventIndex(int value) {
    this._selectedEventIndex = value;
    notifyListeners();
  }
}
