import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  static const String routeName = '/calendar';

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalendar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: TableCalendar(
              availableGestures: AvailableGestures.all,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime(2022),
              lastDay: DateTime(9999),
              onDaySelected: _onDaySelected,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                    color: Color(0xFF3C37FF), shape: BoxShape.circle),
                todayDecoration: BoxDecoration(
                    color: Color(0xFFDAE2FF), shape: BoxShape.circle),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              child: ListTile(
                tileColor: Color(0xFFE1E2EC),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                title: Text('Family Trip'),
                subtitle: Row(
                  children: [
                    Icon(Icons.av_timer_sharp),
                    SizedBox(
                      width: 6,
                    ),
                    Text('10:30 - 13:00')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
