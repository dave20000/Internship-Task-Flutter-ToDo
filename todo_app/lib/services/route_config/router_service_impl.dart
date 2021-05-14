import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/route_config/router_service.dart';
import 'package:todo_app/ui/screens/home_screen.dart';
import 'package:todo_app/ui/screens/profile_screen.dart';
import 'package:todo_app/ui/screens/todo_tasks_screens/todo_details.dart';
import 'package:todo_app/ui/screens/todo_tasks_screens/todo_form.dart';

class RouterServiceImpl implements RouterService {
  FluroRouter router;

  RouterServiceImpl() {
    router = new FluroRouter();
    configureRoutes();
  }

  static String homeRoute = "/home";
  static String toDoDetailRoute = "/home/:id/:colorValue";
  static String addToDoRoute = "/add";
  static String editToDoRoute = "/edit/:id";
  static String profileRoute = "/profile";

  static Handler emptyHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Scaffold(
      body: Center(
        child: Text("Page not avaialble"),
      ),
    );
  });

  static Handler toDoDetailHandler = new Handler(
    handlerFunc: (context, Map<String, dynamic> params) {
      final id = int.parse(params['id'][0]);
      final colorValue = int.parse(params['colorValue'][0]);
      return ToDoDetailScreen(id: id, colorValue: colorValue);
    },
  );

  static Handler addHandler =
      new Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return AddEditToDoScreen();
  });

  static Handler editHandler = new Handler(
    handlerFunc: (context, Map<String, dynamic> params) {
      final id = int.parse(params['id'][0]);
      return AddEditToDoScreen(
        id: id,
      );
    },
  );

  static Handler profileHandler =
      new Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ProfileScreen();
  });

  static Handler homeHandler =
      new Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return HomeScreen();
  });

  void configureRoutes() {
    router.notFoundHandler = emptyHandler;
    router.define(homeRoute, handler: homeHandler);
    router.define(toDoDetailRoute,
        handler: toDoDetailHandler, transitionType: TransitionType.inFromLeft);
    router.define(addToDoRoute,
        handler: addHandler, transitionType: TransitionType.inFromBottom);
    router.define(editToDoRoute,
        handler: editHandler, transitionType: TransitionType.inFromTop);
    router.define(profileRoute, handler: profileHandler);
  }
}
