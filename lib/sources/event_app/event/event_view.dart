import 'event_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  //danh sach su kien
  List<EventModel> items=[];
  final eventService =EventService();

  final calendarController=CalendarController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarController.view=CalendarView.day;
    loadEvents();
  }
  Future<void> loadEvents() async{
    final events=await eventService.getAllEvents();

    setState(() {
      // items=events;
    });
  }
  @override
  Widget build(BuildContext context) {
    final al=AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(al.appTitle),),
    );
  }


}
