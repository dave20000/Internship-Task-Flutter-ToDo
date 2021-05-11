import 'package:flutter/material.dart';
import 'package:todo_app/route_config/application.dart';

class BottomNav extends StatelessWidget {
  final bool isHomeScreen;
  BottomNav({this.isHomeScreen});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (!isHomeScreen) {
                Application.router.navigateTo(context, "/home");
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
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Application.router.navigateTo(context, "/add");
            },
            elevation: 5.0,
            fillColor: Theme.of(context).accentColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            padding: EdgeInsets.all(5.0),
            shape: CircleBorder(),
          ),
          GestureDetector(
            onTap: () {
              if (isHomeScreen) {
                Application.router.navigateTo(context, "/profile");
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
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
