// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

// /// The hove page which hosts the calendar
// class GrafikWidget extends StatefulWidget {
//   /// Creates the home page to display teh calendar widget.
//   const GrafikWidget({Key key}) : super(key: key);

//   @override
//   _GrafikWidgetState createState() => _GrafikWidgetState();
// }

// class _GrafikWidgetState extends State<GrafikWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SfCalendar(
//       resourceViewSettings: ResourceViewSettings(visibleResourceCount: 2),
//       resourceViewHeaderBuilder:
//           (BuildContext context, ResourceViewHeaderDetails details) {
//         if (details.resource.image != null) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               //CircleAvatar(backgroundColor: details.resource.image),
//               CircleAvatar(backgroundColor: Colors.red),
//               Text(details.resource.displayName)
//             ],
//           );
//         } else {
//           return Container(
//             color: details.resource.color,
//             child: Text(details.resource.displayName),
//           );
//         }
//       },
//       view: CalendarView.timelineMonth,
//       dataSource: MeetingDataSource(_getDataSource()),
//       // by default the month appointment display mode set as Indicator, we can
//       // change the display mode as appointment using the appointment display
//       // mode property
//       monthViewSettings: const MonthViewSettings(
//           appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
//     ));
//   }

//   List<Meeting> _getDataSource() {
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//         DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime = startTime.add(const Duration(hours: 2));
//     meetings.add(Meeting(
//         'sasai kudasai', startTime, endTime, const Color(0xFF0F8644), false));
//     return meetings;
//   }
// }

// /// An object to set the appointment collection data source to calendar, which
// /// used to map the custom appointment data to the calendar appointment, and
// /// allows to add, remove or reset the appointment collection.
// class MeetingDataSource extends CalendarDataSource {
//   /// Creates a meeting data source, which used to set the appointment
//   /// collection to the calendar
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return _getMeetingData(index).from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return _getMeetingData(index).to;
//   }

//   @override
//   String getSubject(int index) {
//     return _getMeetingData(index).eventName;
//   }

//   @override
//   Color getColor(int index) {
//     return _getMeetingData(index).background;
//   }

//   @override
//   bool isAllDay(int index) {
//     return _getMeetingData(index).isAllDay;
//   }

//   Meeting _getMeetingData(int index) {
//     final dynamic meeting = appointments[index];
//     Meeting meetingData;
//     if (meeting is Meeting) {
//       meetingData = meeting;
//     }

//     return meetingData;
//   }
// }

// class AppointmentDataSource extends CalendarDataSource {
//   AppointmentDataSource(
//       List<Appointment> source, List<CalendarResource> resourceColl) {
//     List<CalendarResource> resourceColl = <CalendarResource>[];
//     resourceColl.add(CalendarResource(
//       displayName: 'John',
//       id: '0001',
//       color: Colors.red,
//     ));
//     source.add(Appointment(startTime: startTime, endTime: endTime))
//     appointments = source;
//     resources = resourceColl;
//   }
// }

// /// Custom business object class which contains properties to hold the detailed
// /// information about the event data which will be rendered in calendar.
// class Meeting {
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;

//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;

//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;

//   /// Background which is equivalent to color property of [Appointment].
//   Color background;

//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(GrafikWidget());

class GrafikWidget extends StatefulWidget {
  @override
  GrafikWidgetState createState() => GrafikWidgetState();
}

class GrafikWidgetState extends State<GrafikWidget> {
  List<Appointment> _shiftCollection = <Appointment>[];
  List<CalendarResource> _employeeCollection = <CalendarResource>[];
  _DataSource _events;

  @override
  void initState() {
    _addResources();
    _addAppointments();
    _events = _DataSource(_shiftCollection, _employeeCollection);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.timelineWeek,
            allowedViews: [
              CalendarView.timelineDay,
              CalendarView.timelineWeek,
              CalendarView.timelineWorkWeek,
            ],
            showDatePickerButton: true,
            resourceViewSettings: ResourceViewSettings(
                displayNameTextStyle: TextStyle(color: Colors.white),
                showAvatar: false,
                size: 120,
                visibleResourceCount: 5),
            dataSource: _events,
          ),
        ),
      ),
    );
  }

  void _addResources() {
    Random random = Random();
    List<String> _nameCollection = <String>[];
    _nameCollection.add('John');
    _nameCollection.add('Bryan');
    _nameCollection.add('Robert');
    _nameCollection.add('Kenny');
    _nameCollection.add('Tia');
    _nameCollection.add('Theresa');
    _nameCollection.add('Edith');
    _nameCollection.add('Brooklyn');
    _nameCollection.add('James William');
    _nameCollection.add('Sophia');
    _nameCollection.add('Elena');
    _nameCollection.add('Stephen');
    _nameCollection.add('Zoey Addison');
    _nameCollection.add('Daniel');
    _nameCollection.add('Emilia');
    _nameCollection.add('Kinsley Elena');
    _nameCollection.add('Daniel');
    _nameCollection.add('William');
    _nameCollection.add('Addison');
    _nameCollection.add('Ruby');

    List<Color> _resourceColorCollection = <Color>[];
    _resourceColorCollection.add(const Color(0xFF7c9473));
    _resourceColorCollection.add(const Color(0xFFcfdac8));
    _resourceColorCollection.add(const Color(0xFFcdd0cb));
    _resourceColorCollection.add(const Color(0xFF9dad7f));

    for (int i = 0; i < _nameCollection.length; i++) {
      _employeeCollection.add(CalendarResource(
        displayName: _nameCollection[i],
        id: '000' + i.toString(),
        color: _resourceColorCollection[random.nextInt(4)],
      ));
    }
  }

  void _addAppointments() {
    _shiftCollection = <Appointment>[];
    List<String> _subjectCollection = <String>[];
    _subjectCollection.add('General Meeting');
    _subjectCollection.add('Plan Execution');
    _subjectCollection.add('Project Plan');
    _subjectCollection.add('Consulting');
    _subjectCollection.add('Support');
    _subjectCollection.add('Development Meeting');
    _subjectCollection.add('Scrum');
    _subjectCollection.add('Project Completion');
    _subjectCollection.add('Release updates');
    _subjectCollection.add('Performance Check');

    List<Color> _colorCollection = <Color>[];
    _colorCollection.add(const Color(0xFFbe9fe1));
    _colorCollection.add(const Color(0xFFc9b6e4));
    _colorCollection.add(const Color(0xFFe1ccec));
    _colorCollection.add(const Color(0xFFf1f1f6));

    final Random random = Random();
    for (int i = 0; i < _employeeCollection.length; i++) {
      final List<String> _employeeIds = <String>[
        _employeeCollection[i].id.toString()
      ];
      if (i == _employeeCollection.length - 1) {
        int index = random.nextInt(5);
        index = index == i ? index + 1 : index;
        _employeeIds.add(_employeeCollection[index].id.toString());
      }

      for (int k = 0; k < 365; k++) {
        if (_employeeIds.length > 1 && k % 2 == 0) {
          continue;
        }
        for (int j = 0; j < 2; j++) {
          final DateTime date = DateTime.now().add(Duration(days: k + j));
          int startHour = 9 + random.nextInt(6);
          startHour =
              startHour >= 13 && startHour <= 14 ? startHour + 1 : startHour;
          final DateTime _shiftStartTime =
              DateTime(date.year, date.month, date.day, startHour, 0, 0);
          _shiftCollection.add(Appointment(
              startTime: _shiftStartTime,
              endTime: _shiftStartTime.add(Duration(hours: 1)),
              subject: _subjectCollection[random.nextInt(8)],
              color: _colorCollection[random.nextInt(4)],
              resourceIds: _employeeIds));
        }
      }
    }
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source, List<CalendarResource> resourceColl) {
    appointments = source;
    resources = resourceColl;
  }
}
