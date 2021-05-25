import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/view_models/tasks.dart';

class ToDoDetailScreen extends StatelessWidget {
  final int id;
  ToDoDetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TasksViewModel>(context).getById(id);
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: task.categoryColor(),
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
          /*
          SvgPicture.asset(
            //"assets/${task.category.toLowerCase()}.png",
            "assets/fun.png",
            color: task.categoryColor(),
            height: MediaQuery.of(context).size.height / 3.0,
            placeholderBuilder: (BuildContext context) =>
                Container(child: const CircularProgressIndicator()),
          ),
          */
          Container(
            height: MediaQuery.of(context).size.height / 3.0,
            color: task.categoryColor(),
            child: Image(
                image: AssetImage("assets/${task.category.toLowerCase()}.png")),
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
                      color: task.categoryColor(),
                    ),
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
      )),
    );
  }
}
