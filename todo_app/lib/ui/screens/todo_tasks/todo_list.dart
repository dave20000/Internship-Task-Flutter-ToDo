import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/view_models/tasks.dart';
import 'package:todo_app/ui/screens/todo_tasks/todo_details.dart';
import '../../widgets/todo_card.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('To Do', style: Theme.of(context).textTheme.headline5),
          ),
        ),
        Consumer<TasksViewModel>(
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
                      return OpenContainer(
                        transitionDuration: Duration(milliseconds: 800),
                        transitionType: ContainerTransitionType.fadeThrough,
                        openBuilder: (context,
                            void Function({bool returnValue}) closedContainer) {
                          return ToDoDetailScreen(
                            id: index + 1,
                          );
                        },
                        onClosed: (success) {
                          if (success != null && success) {
                            tasksModel.refreshTasks();
                          }
                        },
                        useRootNavigator: true,
                        closedElevation: 0,
                        closedShape: RoundedRectangleBorder(),
                        closedColor: Colors.transparent,
                        closedBuilder: (context, openContainer) {
                          return GestureDetector(
                            onTap: () {
                              openContainer();
                            },
                            child: ToDoCard(
                              task: tasks[index],
                            ),
                          );
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
        ),
      ],
    );
  }
}
