import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:imake/flutter_flow/chat/index.dart';
import 'package:imake/grafik/calendar.dart';
import 'package:intl/intl.dart';
import 'package:cell_calendar/cell_calendar.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('MMMM').format(now);

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.yellow,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.125,
              child: Center(
                  child: Text(
                'График',
                style: TextStyle(fontSize: 25),
              )),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0),
                  )),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        child: Image.network(
                          'https://picsum.photos/seed/picsum/200/300',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        child: Image.network(
                          'https://picsum.photos/seed/picsum/200/300',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        child: Image.network(
                          'https://picsum.photos/seed/picsum/200/300',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        child: Image.network(
                          'https://picsum.photos/seed/picsum/200/300',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    child: ListView(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('9 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('10 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('11 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('12 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('13 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('14 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('15 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('16 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('17 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('18 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('19 00'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('30'))),
                          Container(
                              width: 40,
                              height: 25,
                              child: Center(child: Text('20 00'))),
                        ],
                      ),
                    ]),
                  ),
                  CalendarWeek(
                    pressedDateBackgroundColor: Colors.grey,
                    dateStyle: TextStyle(color: Colors.black),
                    controller: CalendarWeekController(),
                    height: 100,
                    showMonth: false,
                    minDate: DateTime.now().add(
                      Duration(days: -365),
                    ),
                    maxDate: DateTime.now().add(
                      Duration(days: 365),
                    ),
                    onDatePressed: (DateTime datetime) {
                      // Do something
                    },
                    onDateLongPressed: (DateTime datetime) {
                      // Do something
                    },
                    onWeekChanged: () {
                      // Do something
                    },
                    decorations: [
                      DecorationItem(
                          decorationAlignment: FractionalOffset.bottomRight,
                          date: DateTime.now(),
                          decoration: Icon(
                            Icons.today,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Calendarr()));
                    },
                    child: Container(
                        height: 75,
                        width: 400,
                        color: Colors.yellow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(formattedDate),
                            Icon(Icons.keyboard_arrow_up)
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
