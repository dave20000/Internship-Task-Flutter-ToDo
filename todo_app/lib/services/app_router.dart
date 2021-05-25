import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/home_screen.dart';
import 'package:todo_app/ui/screens/profile_screen.dart';
import 'package:todo_app/ui/screens/todo_tasks/todo_details.dart';
import 'package:todo_app/ui/screens/todo_tasks/todo_form.dart';

class AppRouter {
  static FluroRouter _router;

  static RouteFactory get routeFactory => (routeSettings) {
        return _router.generator(routeSettings);
      };

  AppRouter();

  static configureRoutes() {
    _router = new FluroRouter();
    _router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return Scaffold(
          body: Center(
            child: Text(
              "Page not avaialble",
              style: TextStyle(color: Colors.yellowAccent[700]),
            ),
          ),
        );
      },
    );
    _router.define(
      "/home",
      handler: new Handler(handlerFunc: (context, Map<String, dynamic> params) {
        return HomeScreen();
      }),
    );
    _router.define(
      "/home/:id",
      handler: new Handler(
        handlerFunc: (context, Map<String, dynamic> params) {
          final id = int.parse(params['id'][0]);
          return ToDoDetailScreen(id: id);
        },
      ),
      transitionType: TransitionType.inFromLeft,
    );
    _router.define(
      "/add",
      handler: new Handler(handlerFunc: (context, Map<String, dynamic> params) {
        return ToDoFormScreen();
      }),
      transitionType: TransitionType.inFromBottom,
    );
    _router.define(
      "/edit/:id",
      handler: new Handler(
        handlerFunc: (context, Map<String, dynamic> params) {
          final id = int.parse(params['id'][0]);
          return ToDoFormScreen(
            id: id,
          );
        },
      ),
      transitionType: TransitionType.inFromTop,
    );
    _router.define(
      "/profile",
      handler: new Handler(handlerFunc: (context, Map<String, dynamic> params) {
        return ProfileScreen();
      }),
    );
  }
}
