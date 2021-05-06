import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/route_config/application.dart';

class ToDoCard extends StatelessWidget {
  final Task task;
  ToDoCard({this.task});

  final _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Application.router
            .navigateTo(context, "/home/${task.id}/${_color.value}");
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        height: 120,
        child: Row(
          children: [
            Container(
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0)),
                color: _color,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${task.taskDate.day.toString()}",
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(height: 10),
                  Text(DateFormat('MMM').format(task.taskDate),
                      style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.headline1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration:
                            BoxDecoration(border: Border.all(color: _color)),
                        child: Text(task.category,
                            style:
                                TextStyle(fontSize: 12, color: Colors.grey))),
                    Text(
                      task.details,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
