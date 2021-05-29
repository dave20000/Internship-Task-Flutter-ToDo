import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/models/enums/categories.dart';
import 'package:todo_app/models/view_models/task.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/ui/widgets/base_widget.dart';
import 'package:todo_app/ui/widgets/date_selector.dart';

class ToDoFormScreen extends StatefulWidget {
  final int id;
  ToDoFormScreen({this.id});

  @override
  _ToDoFormScreenState createState() => _ToDoFormScreenState();
}

class _ToDoFormScreenState extends State<ToDoFormScreen> {
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

  showToast(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TaskViewModel>(
      onModelReady: (model) async {
        model.isCalendarView = true;
        if (widget.id != null) {
          model.isAdd = false;
          await model.getById(widget.id);
          model.selectedCateogryIndex = model.task.categoryToEnum().index;
        } else {
          model.isAdd = true;
          model.task = new Task();
          model.selectedCateogryIndex = 0;
          model.task.category = Categories.Work.categoryValue();
        }
        titleController.text = model.task.title;
        detailsController.text = model.task.details;
      },
      builder: (context, taskModel, child) {
        if (taskModel.task != null) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Stack(
                            children: [
                              AnimatedSwitcher(
                                transitionBuilder: (child, animation) =>
                                    ScaleTransition(
                                  scale: animation,
                                  child: child,
                                ),
                                duration: Duration(milliseconds: 500),
                                child: taskModel.isCalendarView
                                    ? DateSelector(
                                        startDate: taskModel.task.taskDate,
                                        endDate: taskModel.task.endDate,
                                        getDates: (start, end) {
                                          taskModel.updateDate(start, end);
                                        },
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          taskModel.changeCalendarView();
                                        },
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  DateFormat('yyyy')
                                                          .format(taskModel
                                                              .task.taskDate)
                                                          .toString() +
                                                      " " +
                                                      DateFormat('MMM')
                                                          .format(taskModel
                                                              .task.taskDate)
                                                          .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5,
                                                ),
                                                Text(
                                                  DateFormat('dd')
                                                          .format(taskModel
                                                              .task.taskDate)
                                                          .toString() +
                                                      " - " +
                                                      DateFormat('dd')
                                                          .format(taskModel.task
                                                                  .endDate ??
                                                              taskModel.task
                                                                  .taskDate)
                                                          .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                              for (var category in Categories.values)
                                category.index: Text(
                                  category.categoryValue(),
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                            },
                            onValueChanged: (int val) {
                              taskModel.selectedCateogryIndex = val;
                              taskModel.updateCategory(
                                  Categories.values[val].categoryValue());
                            },
                            groupValue: taskModel.selectedCateogryIndex,
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
                            onPressed: () async {
                              if (taskModel.task.taskDate != null) {
                                if (taskModel.isCalendarView)
                                  taskModel.changeCalendarView();
                                if (titleController.text.isNotEmpty ||
                                    detailsController.text.isNotEmpty) {
                                  if (_formKey.currentState.validate()) {
                                    taskModel.updateTitleAndDetailS(
                                      titleController.text,
                                      detailsController.text,
                                    );

                                    if (taskModel.isAdd) {
                                      await taskModel.addTask();
                                      showToast(
                                        "New task added succesfully",
                                        Colors.greenAccent,
                                      );
                                    } else {
                                      await taskModel.editTask();
                                      showToast(
                                        "Edit task succesfully",
                                        Colors.greenAccent,
                                      );
                                    }
                                    _formKey.currentState.reset();
                                    Navigator.pop(context, true);
                                  }
                                }
                              } else {
                                showToast(
                                  "Please select a date",
                                  Colors.red,
                                );
                              }
                            },
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
