import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/viewModels/tasks.dart';
import 'package:todo_app/widgets/bottom_nav.dart';
import '../../widgets/todo_card.dart';

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
            builder: (context, taskProvider, child) {
              return FutureBuilder<List<Task>>(
                future: taskProvider.getTasks(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ToDoCard(
                            task: snapshot.data[index],
                          );
                        });
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
