import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/business_logic/view_models/form_view_model.dart';
import 'package:todo_app/business_logic/view_models/tasks_view_model.dart';
import 'package:todo_app/business_logic/enums/todo_mode.dart';
import 'package:todo_app/business_logic/models/constants.dart';
import 'package:todo_app/business_logic/models/task.dart';
import 'package:todo_app/ui/widgets/date_selector.dart';

class AddEditToDoScreen extends StatefulWidget {
  final int id;
  AddEditToDoScreen({this.id});

  @override
  _AddEditToDoScreenState createState() => _AddEditToDoScreenState();
}

class _AddEditToDoScreenState extends State<AddEditToDoScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController;
  TextEditingController detailsController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    detailsController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  void controllerValues(String title, String details) {
    titleController.text = title;
    detailsController.text = details;
  }

  showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Theme.of(context).accentColor,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TasksViewModel>(context, listen: false);
    final Task loadedTask =
        widget.id != null ? taskProvider.getById(widget.id) : null;

    if (loadedTask != null)
      controllerValues(loadedTask.title, loadedTask.details);

    return ChangeNotifierProvider<FormViewModel>(
      create: (ctx) => FormViewModel(loadedTask),
      child: Scaffold(
        body: Consumer<FormViewModel>(
          builder: (context, formValue, child) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Stack(
                          children: [
                            AnimatedSwitcher(
                              duration: Duration(seconds: 1),
                              child: formValue.isCalendarView
                                  ? DateSelector(
                                      startDate: formValue.task.taskDate,
                                      endDate: formValue.task.endDate,
                                      getDates: (start, end) {
                                        formValue.updateDate(start, end);
                                      },
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        formValue.changeCalendarView();
                                      },
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                    DateFormat('yyyy')
                                                            .format(formValue
                                                                .task.taskDate)
                                                            .toString() +
                                                        " " +
                                                        DateFormat('MMM')
                                                            .format(formValue
                                                                .task.taskDate)
                                                            .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5),
                                                Text(
                                                    DateFormat('dd')
                                                            .format(formValue
                                                                .task.taskDate)
                                                            .toString() +
                                                        " - " +
                                                        DateFormat('dd')
                                                            .format(formValue
                                                                    .task
                                                                    .endDate ??
                                                                formValue.task
                                                                    .taskDate)
                                                            .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2),
                                              ],
                                            ),
                                          )),
                                    ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CupertinoSegmentedControl(
                          children: {
                            for (int i = 0; i < categories.length; i++)
                              i: Text(
                                categories[i],
                                style: Theme.of(context).textTheme.headline2,
                              ),
                          },
                          onValueChanged: (int val) {
                            formValue.selectedEventIndex = val;
                            formValue.updateCategory(categories[val]);
                          },
                          groupValue: formValue.selectedCateogryIndex,
                          selectedColor: Theme.of(context).accentColor,
                          borderColor: Theme.of(context).accentColor,
                          pressedColor: Theme.of(context).accentColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Form(
                            key: this._formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  controller: titleController,
                                  style: Theme.of(context)
                                      .inputDecorationTheme
                                      .labelStyle,
                                  decoration: const InputDecoration(
                                    labelText: 'Title',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value.length < 3) {
                                      return 'a minimum of 3 characters is required';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: detailsController,
                                  style: Theme.of(context)
                                      .inputDecorationTheme
                                      .labelStyle,
                                  maxLines: 10,
                                  decoration: const InputDecoration(
                                    labelText: 'Details',
                                    border: InputBorder.none,
                                    alignLabelWithHint: true,
                                  ),
                                  validator: (value) {
                                    if (value.length < 5) {
                                      return 'a minimum of 5 characters is required';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          child: Text('Save',
                              style: Theme.of(context).textTheme.button),
                          onPressed: () {
                            if (formValue.task.taskDate != null) {
                              if (formValue.isCalendarView)
                                formValue.changeCalendarView();
                              if (_formKey.currentState.validate()) {
                                formValue.updateTitleAndDetailS(
                                  titleController.text,
                                  detailsController.text,
                                );
                                if (formValue.mode == TodoMode.add) {
                                  taskProvider.addTask(formValue.task);
                                  showToast("New task added succesfully");
                                } else {
                                  taskProvider.editTask(formValue.task);
                                  showToast("Edit task succesfully");
                                }
                                _formKey.currentState.reset();
                                Navigator.pop(context);
                              }
                            } else {
                              showToast("Please select a date");
                            }
                          },
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
