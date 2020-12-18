import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(TimeRegion_Builder());

class TimeRegion_Builder extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: SfCalendar(
          view: CalendarView.week,
          specialRegions: _getTimeRegions(),
          timeRegionBuilder: timeRegionBuilder,
        )),
      ),
    );
  }

  Widget timeRegionBuilder(
      BuildContext context, TimeRegionDetails timeRegionDetails) {
    if (timeRegionDetails.region.text == "Lunch") {
      return Container(
        color: timeRegionDetails.region.color,
        alignment: Alignment.center,
        child: Icon(
          Icons.restaurant,
          color: Colors.grey.withOpacity(0.5),
        ),
      );
    } else if (timeRegionDetails.region.text == "WeekEnd") {
      return Container(
        color: timeRegionDetails.region.color,
        alignment: Alignment.center,
        child: Icon(
          Icons.weekend,
          color: Colors.grey.withOpacity(0.5),
        ),
      );
    }
  }
}

List<TimeRegion> _getTimeRegions() {
  final List<TimeRegion> regions = <TimeRegion>[];
  DateTime date = DateTime.now();
  regions.add(TimeRegion(
    startTime: DateTime(2020, 12, 15, 13, 0, 0),
    endTime: DateTime(2020, 12, 15, 14, 0, 0),
    enablePointerInteraction: true,
    color: Colors.grey.withOpacity(0.2),
    recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
    text: 'Lunch',
  ));
  regions.add(TimeRegion(
    startTime: DateTime(2020, 12, 15, 00, 0, 0),
    endTime: DateTime(2020, 12, 15, 24, 0, 0),
    recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=SAT,SUN',
    color: Color(0xffbD3D3D3),
    text: 'WeekEnd',
  ));
  return regions;
}
