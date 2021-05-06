import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/viewModels/tasks.dart';
import 'todo_card.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('To Do', style: Theme.of(context).textTheme.headline5),
          ),
        ),
        Expanded(
          child: Consumer<Tasks>(
            builder: (context, task, child) {
              return ListView.builder(
                  itemCount: task.tasks.length,
                  itemBuilder: (context, index) {
                    return ToDoCard(
                      task: task.tasks[index],
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
