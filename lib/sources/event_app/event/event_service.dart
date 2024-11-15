import 'package:cent/sources/event_app/event/event_model.dart';
import 'package:localstore/localstore.dart';

class EventService{
  final db=Localstore.getInstance(useSupportDir: true);
   final path='events';//tên collections trong localstore(giống như tên bảng);

   Future<List<EventModel>> getAllEvents() async{ //hàm lấy danh sách sự kiện từ localstore
     final eventsMap=await db.collection(path).get();
     if(eventsMap!=null)
       {
         return eventsMap.entries.map((entry){
           final eventData=entry.value as Map<String,dynamic>;
           if(!eventData.containsKey('id'))
             {
               eventData['id']=entry.key.split('/').last;
             }return EventModel.fromMap(eventData);
         }).toList();
       }
   return [];
   }

  //hàm lưu một sự kiện vào localstore
   Future<void> saveEvent(EventModel item)async{
     //nếu id không tồn tại (tạo mới) thì lấy một id ngẫu nhiên
     item.id??=db.collection(path).doc().id;
     await db.collection(path).doc(item.id).set(item.toMap());
   }
   //hàm xóa một sự kiện từ localstore
  Future<void> deleteEvent(EventModel item)async{

    await db.collection(path).doc(item.id).delete();
  }
}