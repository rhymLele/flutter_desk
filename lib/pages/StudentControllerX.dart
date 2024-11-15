import 'package:cent/models/student.dart';
import 'package:get/get.dart';

class StudentcontrollerX extends GetxController{
  final RxList<Student> listStudent= <Student>[].obs;
  int _lastId = 0;
  void addStudent(Student a)
  {
    a.id=generateId();
    listStudent.add(a);
  }
  void removeStudent(int index)
  {
    listStudent.removeAt(index);
  }
  String generateId() {
    _lastId++;
    return 'SV$_lastId';
  }
}