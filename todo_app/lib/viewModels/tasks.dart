import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task(
        id: 0,
        title: "Special",
        details: "Hello , I would like to take out something",
        taskDate: DateTime.utc(2021, 1, 5),
        endDate: DateTime.utc(2021, 1, 5),
        category: "Work"),
    Task(
        id: 1,
        title: "Go Home",
        details: "Depawali at home",
        taskDate: DateTime.utc(2021, 5, 3),
        endDate: DateTime.utc(2021, 5, 4),
        category: "Family"),
    Task(
        id: 2,
        title: "Girlfriend's Birthday",
        details: "Remeber to buy gifts home",
        taskDate: DateTime.utc(2021, 12, 6),
        endDate: DateTime.utc(2021, 12, 8),
        category: "Birth"),
    Task(
        id: 3,
        title: "Japan Tourism",
        details:
            "Remember to pack your luggage ready for departure and go to fishing",
        taskDate: DateTime.utc(2021, 5, 25),
        endDate: DateTime.utc(2021, 5, 28),
        category: "Family"),
    Task(
        id: 4,
        title: "Work Remaining",
        details: "Complete the remaining wor",
        taskDate: DateTime.utc(2021, 5, 7),
        endDate: DateTime.utc(2021, 5, 10),
        category: "Work"),
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  Task getById(int id) {
    return _tasks.firstWhere((task) => task.id == id);
  }

  void addTask(String title, String details, DateTime startDate,
      DateTime endDate, String category) {
    Task task = new Task(
        id: _tasks.last.id + 1,
        title: title,
        details: details,
        taskDate: startDate,
        endDate: endDate,
        category: category);
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(Task task) {
    _tasks[task.id].title = task.title;
    _tasks[task.id].taskDate = task.taskDate;
    _tasks[task.id].endDate = task.endDate;
    _tasks[task.id].details = task.details;
    _tasks[task.id].category = task.category;
    notifyListeners();
  }
}
