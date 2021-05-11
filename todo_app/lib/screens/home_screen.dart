import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/viewModels/bottom_tabs_viewmodel.dart';
import 'package:todo_app/widgets/bottom_tab.dart';
import 'package:todo_app/screens/toDo/todo_list.dart';

class HomeScreen extends StatelessWidget {
  static List<Widget> _widgetOptions = <Widget>[ToDoList(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ChangeNotifierProvider<BottomTabsViewModel>(
        create: (ctx) => BottomTabsViewModel(),
        child: Consumer<BottomTabsViewModel>(
          builder: (context, bottomTabModel, child) {
            return Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        bottomTabModel.currentIndex == 0 ? 'To Do' : 'Profile',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                ),
                _widgetOptions[bottomTabModel.currentIndex],
                BottomTab(
                  isHomeScreen: bottomTabModel.currentIndex == 0 ? true : false,
                  tabPressed: (num) {
                    bottomTabModel.currentIndex = num;
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
