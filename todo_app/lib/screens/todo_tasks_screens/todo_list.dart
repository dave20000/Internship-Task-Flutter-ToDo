import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_models/tasks_view_model.dart';
import '../../widgets/todo_card.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TasksViewModel>(
        builder: (context, taskProvider, child) {
          return ListView.builder(
            itemCount: taskProvider.taskList.length,
            itemBuilder: (context, index) {
              return ToDoCard(
                task: taskProvider.taskList[index],
              );
            },
          );
        },
      ),
    );
  }
}
