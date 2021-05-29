import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/models/enums/categories.dart';

part 'task.g.dart';

@JsonSerializable()
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

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

extension TaskExtension on Task {
  Color categoryColor() {
    //return Colors.primaries[Random().nextInt(Colors.primaries.length)];
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
