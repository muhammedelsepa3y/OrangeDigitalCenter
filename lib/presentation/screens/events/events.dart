
import 'package:hive/hive.dart';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../views/constancts/app_color.dart';


class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = EventController();
  @override
  void initState() {
    // TODO: implement initState
    controller.addAll(events_);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("Orange Events"),
      ),
      body:  MonthView(controller: controller),
    );
  }
}
List <CalendarEventData> events_=[
  CalendarEventData(date: DateTime(2022, 10, 10), event: "Event 1", title: 'Event 1',color: Colors.orange),
  CalendarEventData(date: DateTime(2022, 10, 11), event: "Event 2", title: 'Event 2',color: Colors.red),
  CalendarEventData(date: DateTime(2022, 10, 12), event: "Event 3", title: 'Event 3',color: Colors.green),
  CalendarEventData(date: DateTime(2022, 10, 13), event: "Event 4", title: 'Event 4',color: Colors.cyan),
  CalendarEventData(date: DateTime(2022, 10, 14), event: "Event 5", title: 'Event 5',color: Colors.yellow),
  CalendarEventData(date: DateTime(2022, 10, 15), event: "Event 6", title: 'Event 6',color: Colors.deepPurple),
  CalendarEventData(date: DateTime(2022, 10, 16), event: "Event 7", title: 'Event 7',color: Colors.pink),
  CalendarEventData(date: DateTime(2022, 10, 17), event: "Event 8", title: 'Event 8',color: Colors.blue),
  CalendarEventData(date: DateTime(2022, 10, 18), event: "Event 9", title: 'Event 9',color: Colors.purple),
  CalendarEventData(date: DateTime(2022, 10, 19), event: "Event 10", title: 'Event 10',color: Colors.brown),
  CalendarEventData(date: DateTime(2022, 10, 20), event: "Event 11", title: 'Event 11',color: Colors.teal),
  CalendarEventData(date: DateTime(2022, 10, 21), event: "Event 12", title: 'Event 12',color: Colors.indigo),
  CalendarEventData(date: DateTime(2022, 10, 22), event: "Event 13", title: 'Event 13',color: Colors.lime),
  CalendarEventData(date: DateTime(2022, 10, 23), event: "Event 14", title: 'Event 14',color: Colors.amber),
  CalendarEventData(date: DateTime(2022, 10, 24), event: "Event 15", title: 'Event 15',color: Colors.deepOrange),
  CalendarEventData(date: DateTime(2022, 10, 25), event: "Event 16", title: 'Event 16',color: Colors.lightBlue),
  CalendarEventData(date: DateTime(2022, 10, 26), event: "Event 17", title: 'Event 17',color: Colors.lightGreen),
  CalendarEventData(date: DateTime(2022, 10, 27), event: "Event 18", title: 'Event 18',color: Colors.grey),
  CalendarEventData(date: DateTime(2022, 10, 28), event: "Event 19", title: 'Event 19',color: Colors.blueGrey),
  CalendarEventData(date: DateTime(2022, 10, 29), event: "Event 20", title: 'Event 20',color: Colors.black),
  CalendarEventData(date: DateTime(2022, 10, 31), event: "Event 22", title: 'Event 22',color: Colors.redAccent),
  CalendarEventData(date: DateTime(2022, 11, 1), event: "Event 23", title: 'Event 23',color: Colors.greenAccent),

];
