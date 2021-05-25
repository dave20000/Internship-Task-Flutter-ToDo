import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/profile_screen.dart';
import 'package:todo_app/ui/screens/todo_tasks/todo_list.dart';
import 'package:todo_app/ui/widgets/bottom_tab.dart';

class HomeScreen extends StatefulWidget {
  static List<Widget> _widgetOptions = <Widget>[ToDoList(), ProfileScreen()];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
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
      ),
    );
  }
}
