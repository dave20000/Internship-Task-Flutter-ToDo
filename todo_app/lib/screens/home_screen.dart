import 'package:flutter/material.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/widgets/bottom_tab.dart';
import 'package:todo_app/screens/todo_tasks_screens/todo_list.dart';

class HomeScreen extends StatefulWidget {
  static List<Widget> _widgetOptions = <Widget>[ToDoList(), ProfileScreen()];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(selectedIndex == 0 ? 'To Do' : 'Profile',
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          HomeScreen._widgetOptions[selectedIndex],
          BottomTab(
            isHomeScreen: selectedIndex == 0 ? true : false,
            tabPressed: (num) {
              setState(() {
                selectedIndex = num;
              });
            },
          )
        ],
      ),
    );
  }
}
