import 'package:cent/sources/event_app/event/event_model.dart';

class EventModel{
  String? id;
  DateTime startTime;
  DateTime endTime;
  bool isAllDay;
  String subject;
  String? notes;
  String? recurrenceRule;



  EventModel(
      {this.id,
       required this.startTime,
        required this.endTime,
        this.isAllDay=false,
         this.subject='',
      this.notes,
      this.recurrenceRule});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'isAllDay': isAllDay,
      'subject': subject,
      'notes': notes,
      'recurrenceRule': recurrenceRule,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] != null ? map['id'] as String : null,
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int),
      isAllDay: map['isAllDay'] as bool,
      subject: map['subject'] as String,
      notes: map['notes'] != null ? map['notes'] as String : null,
      recurrenceRule: map['recurrenceRule'] != null ? map['recurrenceRule'] as String : null,
    );
  }
}
