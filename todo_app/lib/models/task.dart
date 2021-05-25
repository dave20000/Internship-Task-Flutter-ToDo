import 'package:flutter/material.dart';
import 'package:todo_app/models/enums/categories.dart';

class Task {
  int id;
  String title;
  String details;
  DateTime taskDate;
  DateTime endDate;
  String category;

  Task({
    this.id,
    this.title,
    this.details,
    this.taskDate,
    this.endDate,
    this.category,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'details': details,
      'taskDate': taskDate.toIso8601String(),
      'endDate': endDate.toIso8601String() ?? taskDate.toIso8601String(),
      'category': category
    };
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    details = map['details'];
    taskDate = DateTime.parse(map['taskDate']);
    endDate = DateTime.parse(map['endDate']);
    category = map['category'];
  }
}

extension TaskExtension on Task {
  Color categoryColor() {
    var x = this.categoryToEnum();
    var color;
    switch (x) {
      case Categories.Work:
        color = Colors.orangeAccent;
        break;
      case Categories.Fun:
        color = Colors.pinkAccent;
        break;
      case Categories.Sport:
        color = Colors.indigoAccent;
        break;
      case Categories.Study:
        color = Colors.blueAccent;
        break;
      case Categories.Family:
        color = Colors.amberAccent;
        break;
      case Categories.Birth:
        color = Colors.limeAccent;
        break;
    }
    return color;
  }

  Categories categoryToEnum() {
    Categories val;
    switch (this.category) {
      case "Work":
        val = Categories.Work;
        break;
      case "Fun":
        val = Categories.Fun;
        break;
      case "Family":
        val = Categories.Family;
        break;
      case "Sport":
        val = Categories.Sport;
        break;
      case "Study":
        val = Categories.Study;
        break;
      case "Birth":
        val = Categories.Birth;
        break;
    }
    return val;
  }
}
