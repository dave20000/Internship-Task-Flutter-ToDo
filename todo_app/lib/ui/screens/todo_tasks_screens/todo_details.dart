import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/business_logic/view_models/tasks_view_model.dart';

class ToDoDetailScreen extends StatelessWidget {
  final int id;
  final int colorValue;
  ToDoDetailScreen({this.id, this.colorValue});

  AssetImage getImage(String category) {
    if (category == "Family") {
      return AssetImage("assets/family.png");
    } else if (category == "Work") {
      return AssetImage("assets/work.png");
    } else if (category == "Study") {
      return AssetImage("assets/study.png");
    } else if (category == "Fun") {
      return AssetImage("assets/fun.png");
    } else if (category == "Birth") {
      return AssetImage("assets/birthday.png");
    } else {
      return AssetImage("assets/sport.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TasksViewModel>(context).getById(id);
    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          color: Color(colorValue),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(task.category,
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3.0,
          color: Color(colorValue),
          child: Image(image: getImage(task.category)),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            left: 24.0,
            right: 24.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(task.title,
                      style: Theme.of(context).textTheme.headline5)),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/edit/${id.toString()}");
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(colorValue)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
            left: 24.0,
            right: 24.0,
          ),
          child: Text(
              task.taskDate.day.toString() +
                  " " +
                  DateFormat('MMM').format(task.taskDate),
              style: Theme.of(context).textTheme.headline3),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
            left: 24.0,
            right: 24.0,
          ),
          child: Text(task.details,
              style: TextStyle(fontSize: 15, color: Colors.grey)),
        ),
      ],
    ));
  }
}
