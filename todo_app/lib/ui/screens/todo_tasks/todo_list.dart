import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/view_models/tasks.dart';
import '../../widgets/todo_card.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksViewModel>(
      builder: (context, tasksModel, child) {
        return Expanded(
            child: FutureBuilder(
          future: tasksModel.taskList,
          builder: (BuildContext ctx, AsyncSnapshot<List<Task>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<Task> tasks = snapshot?.data ?? <Task>[];
              if (tasks.isEmpty) {
                return Center(
                  child: Text(
                    'Start Adding New ToDo Tasks',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                );
              }
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ToDoCard(
                    task: tasks[index],
                    isEdited: (val) {
                      if (val != null && val) {
                        tasksModel.refreshTasks();
                      }
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
      },
    );
  }
}
