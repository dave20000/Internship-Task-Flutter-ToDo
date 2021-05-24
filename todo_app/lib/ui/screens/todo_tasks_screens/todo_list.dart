import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/business_logic/view_models/tasks_view_model.dart';
import '../../widgets/todo_card.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TasksViewModel>(
        builder: (context, taskProvider, child) {
          if (taskProvider.taskList.isNotEmpty) {
            return ListView.builder(
              itemCount: taskProvider.taskList.length,
              itemBuilder: (context, index) {
                return ToDoCard(
                  task: taskProvider.taskList[index],
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "Start Adding New ToDo Tasks",
                style: Theme.of(context).textTheme.headline1,
              ),
            );
          }
        },
      ),
    );
  }
}
