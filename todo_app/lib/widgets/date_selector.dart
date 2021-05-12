import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DateSelector extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Function(DateTime, DateTime) getDates;
  DateSelector({this.startDate, this.endDate, this.getDates});
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: HeaderStyle(
        titleTextFormatter: (date, locale) =>
            DateFormat('yyyy').format(date).toString() +
            " " +
            DateFormat('MMM').format(date).toString(),
        titleCentered: true,
        formatButtonVisible: false,
        formatButtonShowsNext: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleTextStyle: Theme.of(context).textTheme.headline5,
        headerPadding: EdgeInsets.fromLTRB(0, 8, 0, 25),
      ),
      pageJumpingEnabled: false,
      rowHeight: 40,
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
            color: Theme.of(context).primaryTextTheme.headline6.color),
        weekendStyle: Theme.of(context).primaryTextTheme.subtitle1,
        dowTextFormatter: (date, locale) =>
            DateFormat.E(locale).format(date)[0],
      ),
      calendarStyle: CalendarStyle(
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        defaultTextStyle: Theme.of(context).primaryTextTheme.headline6,
        todayDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Theme.of(context).accentColor,
          ),
        ),
        todayTextStyle: Theme.of(context).primaryTextTheme.headline6,
        rangeStartTextStyle: Theme.of(context).primaryTextTheme.headline6,
        withinRangeTextStyle: Theme.of(context).primaryTextTheme.headline6,
        rangeEndTextStyle: Theme.of(context).primaryTextTheme.headline6,
        selectedDecoration: BoxDecoration(
          color: Theme.of(context).accentColor,
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
        weekendTextStyle: Theme.of(context).primaryTextTheme.subtitle1,
      ),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: startDate ?? DateTime.now(),
      rangeStartDay: startDate,
      rangeEndDay: endDate,
      calendarFormat: CalendarFormat.month,
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      onRangeSelected: (start, end, focusedDay) {
        getDates(start, end ?? start);
      },
    );
  }
}
