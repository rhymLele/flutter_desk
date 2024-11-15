import 'dart:ui';

import 'event_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
//datasource:
class EventDataSource extends CalendarDataSource{
  EventDataSource(List<EventModel> source)
  {
    appointments=source;
  }
  @override
  DateTime getStartTime(int index) {

    EventModel item=appointments!.elementAt(index);

    return item.startTime;
  }

  @override
  DateTime getEndTime(int index) {
    // TODO: implement getEndTime
    EventModel item=appointments!.elementAt(index);
    return item.endTime;
  }

  @override
  String getSubject(int index) {
    // TODO: implement getSubject
    EventModel item=appointments!.elementAt(index);
    return item.subject;
  }
  @override
  String? getNotes(int index) {
    EventModel item=appointments!.elementAt(index);
    return item.notes;
  }
  @override
  bool isAllDay(int index) {
    EventModel item=appointments!.elementAt(index);
    return item.isAllDay;
  }
  @override
  String? getRecurrenceRule(int index) {
    // TODO: implement getRecurrenceRule
    EventModel item=appointments!.elementAt(index);
    return item.recurrenceRule;
  }
  @override
  Color getColor(int index) {
    EventModel item=appointments!.elementAt(index);
    return item.isAllDay?const Color(0xFF0F8644):super.getColor(index);
  }
}