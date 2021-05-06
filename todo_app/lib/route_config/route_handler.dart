import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/screens/toDo/add_edit_todo_screen.dart';
import 'package:todo_app/screens/toDo/todo_detail_screen.dart';

var emptyHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Scaffold(
    body: Center(
      child: Text("Page not avaialble"),
    ),
  );
});

var toDoDetailHandler = new Handler(
  handlerFunc: (context, Map<String, dynamic> params) {
    final id = int.parse(params['id'][0]);
    final colorValue = int.parse(params['colorValue'][0]);
    return ToDoDetailScreen(id: id, colorValue: colorValue);
  },
);

var addHandler =
    new Handler(handlerFunc: (context, Map<String, dynamic> params) {
  return AddEditToDoScreen(
    id: null,
  );
});

var editHandler = new Handler(
  handlerFunc: (context, Map<String, dynamic> params) {
    final id = int.parse(params['id'][0]);
    return AddEditToDoScreen(
      id: id,
    );
  },
);

var profileHandler =
    new Handler(handlerFunc: (context, Map<String, dynamic> params) {
  return ProfileScreen();
});
