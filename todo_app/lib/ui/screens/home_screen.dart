import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:todo_app/models/view_models/tasks.dart';
import 'package:todo_app/ui/screens/profile_screen.dart';
import 'package:todo_app/ui/screens/todo_tasks/todo_list.dart';
import 'package:todo_app/ui/widgets/base_widget.dart';
import 'package:todo_app/ui/widgets/bottom_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BaseWidget<TasksViewModel>(onModelReady: (model) {
          model.fetchTasks();
        }, builder: (context, tasksModel, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(selectedIndex == 0 ? 'To Do' : 'Profile',
                      style: Theme.of(context).textTheme.headline5),
                ),
              ),
              selectedIndex == 0 ? ToDoList() : ProfileScreen(),
              BottomTab(
                isHomeScreen: selectedIndex == 0 ? true : false,
                tabPressed: (num) {
                  setState(() {
                    selectedIndex = num;
                  });
                },
                taskAdded: (isAdded) {
                  if (isAdded != null && isAdded) {
                    tasksModel.refreshTasks();
                  }
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
