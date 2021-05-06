import 'package:fluro/fluro.dart';
import 'route_handler.dart';

class Routes {
  static String root = "/";
  //static String homeRoute = "/home";
  static String toDoDetailRoute = "/home/:id/:colorValue";
  static String addToDoRoute = "/add";
  static String editToDoRoute = "/edit/:id";
  static String profileRoute = "/profile";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = emptyHandler;
    //router.define(homeRoute, handler: homeHandler);
    router.define(toDoDetailRoute, handler: toDoDetailHandler);
    router.define(addToDoRoute, handler: addHandler);
    router.define(editToDoRoute, handler: editHandler);
    router.define(profileRoute, handler: profileHandler);
  }
}
