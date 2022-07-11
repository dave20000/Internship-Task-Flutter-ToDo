import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/view_models/tasks.dart';
import 'package:todo_app/ui/screens/profile_screen.dart';
import 'package:todo_app/ui/screens/todo_tasks/todo_form.dart';
import 'package:todo_app/ui/screens/todo_tasks/todo_list.dart';
import 'package:todo_app/ui/widgets/base_widget.dart';
//import 'package:todo_app/ui/widgets/bottom_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double _fabDimension = 46.0;
  int selectedIndex = 0;
  List<Widget> pageList = <Widget>[
    ToDoList(),
    ProfileScreen(),
  ];
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TasksViewModel>(
      onModelReady: (model) {
        model.fetchTasks();
      },
      builder: (context, tasksModel, child) {
        return SafeArea(
          child: Scaffold(
            body: PageTransitionSwitcher(
              transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              duration: Duration(milliseconds: 800),
              child: pageList[selectedIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  // icon: Icon(
                  //   Icons.calendar_today_outlined,
                  //   size: 30,
                  //   color: selectedIndex == 0 ? Colors.black : Colors.grey,
                  // ),
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_home,
                    progress: _animationController,
                  ),
                  label: "To Do",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_sharp,
                    size: 30,
                    color: selectedIndex == 1 ? Colors.black : Colors.grey,
                  ),
                  label: "Profile",
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: OpenContainer(
              transitionDuration: Duration(milliseconds: 800),
              transitionType: ContainerTransitionType.fade,
              openBuilder:
                  (context, void Function({bool returnValue}) closedContainer) {
                return ToDoFormScreen(id: null);
              },
              onClosed: (success) {
                if (success != null && success as bool) {
                  tasksModel.refreshTasks();
                }
              },
              useRootNavigator: true,
              closedElevation: 6.0,
              closedShape: CircleBorder(),
              closedColor: Theme.of(context).colorScheme.secondary,
              closedBuilder: (context, openContainer) {
                return InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    openContainer();
                  },
                  child: SizedBox(
                    height: _fabDimension,
                    width: _fabDimension,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
