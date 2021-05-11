import 'package:flutter/material.dart';
import 'package:todo_app/route_config/application.dart';

class BottomTab extends StatelessWidget {
  final bool isHomeScreen;
  final Function(int) tabPressed;
  BottomTab({this.isHomeScreen, this.tabPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (!isHomeScreen) {
                tabPressed(0);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 30,
                  color: isHomeScreen ? Colors.black : Colors.grey,
                ),
                Text(
                  'To Do',
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Application.router.navigateTo(context, "/add");
            },
            child: PhysicalModel(
              color: Theme.of(context).accentColor,
              shadowColor: Theme.of(context).accentColor,
              shape: BoxShape.circle,
              elevation: 4.0,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (isHomeScreen) {
                tabPressed(1);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_sharp,
                  size: 30,
                  color: !isHomeScreen ? Colors.black : Colors.grey,
                ),
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
