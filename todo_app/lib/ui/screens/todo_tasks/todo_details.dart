import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/view_models/task_detail.dart';
import 'package:todo_app/ui/widgets/base_widget.dart';

class ToDoDetailScreen extends StatelessWidget {
  final int id;
  ToDoDetailScreen({this.id});
  @override
  Widget build(BuildContext context) {
    return BaseWidget<TaskDetailViewModel>(
      onModelReady: (model) async {
        await model.fetchTask(id);
      },
      builder: (context, taskDetailViewModel, child) {
        if (taskDetailViewModel.task != null) {
          return WillPopScope(
            onWillPop: () async {
              if (taskDetailViewModel.isEdited) {
                Navigator.pop(context, true);
              } else {
                Navigator.pop(context, false);
              }
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: taskDetailViewModel.task.categoryColor(),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (taskDetailViewModel.isEdited) {
                                      Navigator.pop(context, true);
                                    } else {
                                      Navigator.pop(context, false);
                                    }
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    taskDetailViewModel.task.category,
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () => showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          'Are you sure you want to delete?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        actions: <Widget>[
                                          ElevatedButton(
                                              child: Text('Yes'),
                                              onPressed: () {
                                                taskDetailViewModel
                                                    .deleteTask();
                                                Navigator.pop(context);
                                                Navigator.pop(context, true);
                                              }),
                                          ElevatedButton(
                                              child: Text('No'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.delete_forever),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 3.0,
                            child: SvgPicture.asset(
                              "assets/${taskDetailViewModel.task.category.toLowerCase()}.svg",
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                            child: Text(
                              taskDetailViewModel.task.title,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              var isEdited = await Navigator.pushNamed(context,
                                      "/edit/${taskDetailViewModel.task.id.toString()}")
                                  as bool;
                              if (isEdited != null && isEdited) {
                                taskDetailViewModel
                                    .fetchTask(taskDetailViewModel.task.id);
                                taskDetailViewModel.isEdited = true;
                              }
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: taskDetailViewModel.task.categoryColor(),
                              ),
                            ),
                          )
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
                        taskDetailViewModel.task.taskDate.day.toString() +
                            " " +
                            DateFormat('MMM')
                                .format(taskDetailViewModel.task.taskDate),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        left: 24.0,
                        right: 24.0,
                      ),
                      child: Text(
                        taskDetailViewModel.task.details,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
