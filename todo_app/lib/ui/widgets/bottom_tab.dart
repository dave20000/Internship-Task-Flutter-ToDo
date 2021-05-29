import 'package:flutter/material.dart';

class BottomTab extends StatelessWidget {
  final bool isHomeScreen;
  final Function(int) tabPressed;
  final Function(bool) taskAdded;
  BottomTab({this.isHomeScreen, this.tabPressed, this.taskAdded});
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
            onTap: () async {
              var t = await Navigator.pushNamed(context, "/add");
              taskAdded(t as bool);
            },
            child: PhysicalModel(
              color: Theme.of(context).accentColor,
              shadowColor: Theme.of(context).accentColor,
              shape: BoxShape.circle,
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 25,
                ),
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
