import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/route_config/application.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/viewModels/bottom_nav_bar_viewmodel.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  static List<Widget> _widgetOptions = <Widget>[ToDoList(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    var bnb = Provider.of<BottomNavigationBarViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _widgetOptions.elementAt(bnb.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
            ),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_sharp,
            ),
            label: 'Profile',
          ),
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        currentIndex: bnb.currentIndex,
        selectedIconTheme: Theme.of(context).iconTheme,
        onTap: (index) {
          bnb.currentIndex = index;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Application.router.navigateTo(context, "/add");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
