import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/viewModels/tasks.dart';
import 'package:todo_app/widgets/todo_edit_create_form.dart';
import 'package:todo_app/viewModels/todo_form.dart';

class AddEditToDoScreen extends StatelessWidget {
  final int id;
  AddEditToDoScreen({this.id});

  @override
  Widget build(BuildContext context) {
    final Task loadedTask = id != null
        ? Provider.of<Tasks>(context, listen: false).getById(id)
        : null;

    return ChangeNotifierProvider<ToDoFormViewModel>(
      create: (ctx) => ToDoFormViewModel(loadedTask),
      child: Scaffold(body: ToDoEditCreateForm()),
    );
  }
}
