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


  final calendarController=CalendarController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarController.view=CalendarView.day;
    loadEvent();
  }
  Future<void> loadEvents() async{
    // final events=await eventService.get
  }
  @override
  Widget build(BuildContext context) {
    final al=AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(al.appTitle),),
    );
  }

  Future<void> loadEvent() async {
    // final events=await
  }
}
