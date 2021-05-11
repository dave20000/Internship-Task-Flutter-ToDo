import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/viewModels/tasks.dart';
import 'package:todo_app/viewModels/todo_form_view_model.dart';
import 'package:intl/intl.dart';

class AddEditToDoScreen extends StatelessWidget {
  final int id;
  AddEditToDoScreen({this.id});

  final List<String> _categories = [
    'Work',
    'Fun',
    'Sport',
    'Study',
    'Family',
    'Birth'
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<Tasks>(context, listen: false);
    final Task loadedTask = id != null ? taskProvider.getById(id) : null;

    return ChangeNotifierProvider<ToDoFormViewModel>(
        create: (ctx) => ToDoFormViewModel(loadedTask),
        child: Scaffold(
          body:
              Consumer<ToDoFormViewModel>(builder: (context, formValue, child) {
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
                                  ? TableCalendar(
                                      headerStyle: HeaderStyle(
                                        titleTextFormatter: (date, locale) =>
                                            DateFormat('yyyy')
                                                .format(date)
                                                .toString() +
                                            " " +
                                            DateFormat('MMM')
                                                .format(date)
                                                .toString(),
                                        titleCentered: true,
                                        formatButtonVisible: false,
                                        formatButtonShowsNext: false,
                                        leftChevronVisible: false,
                                        rightChevronVisible: false,
                                        titleTextStyle: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                        headerPadding:
                                            EdgeInsets.fromLTRB(0, 8, 0, 25),
                                      ),
                                      pageJumpingEnabled: false,
                                      rowHeight: 40,
                                      startingDayOfWeek:
                                          StartingDayOfWeek.monday,
                                      daysOfWeekStyle: DaysOfWeekStyle(
                                        weekdayStyle: TextStyle(
                                            color: Theme.of(context)
                                                .primaryTextTheme
                                                .headline6
                                                .color),
                                        weekendStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1,
                                        dowTextFormatter: (date, locale) =>
                                            DateFormat.E(locale)
                                                .format(date)[0],
                                      ),
                                      calendarStyle: CalendarStyle(
                                        defaultDecoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                        ),
                                        defaultTextStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                        todayDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                        todayTextStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                        rangeStartTextStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                        withinRangeTextStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                        rangeEndTextStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                        selectedDecoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          /*borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(17.0),
                                        bottomLeft: const Radius.circular(17.0)),*/
                                        ),
                                        rangeStartDecoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                        ),
                                        rangeEndDecoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                        ),
                                        withinRangeDecoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                        ),
                                        cellMargin: EdgeInsets.all(0),
                                        weekendTextStyle: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1,
                                      ),
                                      firstDay: DateTime.utc(2010, 10, 16),
                                      lastDay: DateTime.utc(2030, 3, 14),
                                      focusedDay:
                                          formValue.startDate ?? DateTime.now(),
                                      rangeStartDay: formValue.startDate,
                                      rangeEndDay: formValue.endDate,
                                      calendarFormat: CalendarFormat.month,
                                      rangeSelectionMode:
                                          RangeSelectionMode.toggledOn,
                                      onRangeSelected:
                                          (start, end, focusedDay) {
                                        formValue.startDate = start;
                                        formValue.endDate = end;
                                      })
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
                                                                .startDate)
                                                            .toString() +
                                                        " " +
                                                        DateFormat('MMM')
                                                            .format(formValue
                                                                .startDate)
                                                            .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5),
                                                Text(
                                                    DateFormat('dd')
                                                            .format(formValue
                                                                .startDate)
                                                            .toString() +
                                                        " - " +
                                                        DateFormat('dd')
                                                            .format(formValue
                                                                    .endDate ??
                                                                formValue
                                                                    .startDate)
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
                            0: Text(
                              'Work',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            1: Text(
                              'Fun',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            2: Text(
                              'Sport',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            3: Text(
                              'Study',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            4: Text(
                              'Family',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            5: Text(
                              'Birth',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          },
                          onValueChanged: (int val) {
                            formValue.selectedEventIndex = val;
                            formValue.category = _categories[val];
                          },
                          groupValue: formValue.selectedEventIndex,
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
                                  controller: formValue.titleController,
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
                                  controller: formValue.detailsController,
                                  style: Theme.of(context)
                                      .inputDecorationTheme
                                      .labelStyle,
                                  maxLines: 10,
                                  decoration: const InputDecoration(
                                    labelText: 'Details',
                                    border: InputBorder.none,
                                    alignLabelWithHint: true,
                                  ),
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
                              if (formValue.startDate != null) {
                                formValue.changeCalendarView();
                                if (_formKey.currentState.validate()) {
                                  if (formValue.task == null) {
                                    taskProvider.addTask(
                                        formValue.titleController.text,
                                        formValue.detailsController.text,
                                        formValue.startDate,
                                        formValue.endDate ??
                                            formValue.startDate,
                                        formValue.category);

                                    Fluttertoast.showToast(
                                        msg: "New task added succesfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  } else {
                                    formValue.task.title =
                                        formValue.titleController.text;
                                    formValue.task.category =
                                        formValue.category;
                                    formValue.task.taskDate =
                                        formValue.startDate;
                                    formValue.task.endDate =
                                        formValue.endDate ??
                                            formValue.startDate;
                                    formValue.task.details =
                                        formValue.detailsController.text;
                                    taskProvider.editTask(formValue.task);
                                    Fluttertoast.showToast(
                                        msg: "Edit task  succesfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  }
                                  _formKey.currentState.reset();
                                  Navigator.pop(context);
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please select a date",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Theme.of(context).accentColor,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              }
                            },
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ))
                ],
              ),
            );
          }),
        ));
  }
}
