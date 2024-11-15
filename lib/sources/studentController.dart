import 'package:get/get.dart';
import 'student.dart';
class StudentController extends GetxController {
  var students = <Student>[].obs;
  var nextId = 1; // Biến để theo dõi ID tiếp theo
  void addStudent(Student student) {
    students.add(student);nextId++; // Tăng ID cho sinh viên tiếp theo
  }
  String generateId() {
    return nextId.toString(); // Trả về ID tiếp theo
  }

}