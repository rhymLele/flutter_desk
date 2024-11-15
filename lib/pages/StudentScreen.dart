import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'StudentControllerX.dart';
import 'package:cent/models/student.dart';

class Studentscreen extends StatelessWidget {
  final StudentcontrollerX studentcontrollerX = Get.put(StudentcontrollerX());
  late final TextEditingController _nameText;
  late final TextEditingController _mathText;
  late final TextEditingController _physicText;
  late final TextEditingController _chemistryText;

  void _intializeControllers() {
    _nameText = TextEditingController();
    _mathText = TextEditingController();
    _physicText = TextEditingController();
    _chemistryText = TextEditingController();
  }

  Studentscreen() {
    _intializeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Student'),
        ),
        body: Column(
          children: [
            Expanded(child: Obx(() {
              return ListView.builder(
                  itemCount: studentcontrollerX.listStudent.length,
                  itemBuilder: (context, index) {
                    final student = studentcontrollerX.listStudent[index];
                    return GestureDetector(
                      onDoubleTap: (){
                        Get.defaultDialog(
                          title: "Xóa Sinh Viên",
                          middleText: "Bạn có chắc chắn muốn xóa ${student.name}?",
                          confirm: ElevatedButton(
                            onPressed: () {
                              studentcontrollerX.listStudent.removeAt(index);
                              Get.back(); // Đóng hộp thoại
                            },
                            child: Text("Xóa"),
                          ),
                          cancel: ElevatedButton(
                            onPressed: () {
                              Get.back(); // Đóng hộp thoại
                            },
                            child: Text("Hủy"),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(student.name),
                        subtitle: Text(''),
                      ),
                    );
                  });
            })),
            Padding(
              padding: EdgeInsets.all(9.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameText,
                    decoration: InputDecoration(labelText: 'Tên'),
                  ),
                  TextField(
                    controller: _mathText,
                    decoration: InputDecoration(labelText: 'Điểm Toán'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _physicText,
                    decoration: InputDecoration(labelText: 'Điểm Lý'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _chemistryText,
                    decoration: InputDecoration(labelText: 'Điểm Hóa'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final name = _nameText.text;
                        final mathScore = double.tryParse(_mathText.text);
                        final physicsScore = double.tryParse(_physicText.text);
                        final chemistryScore =
                            double.tryParse(_chemistryText.text);

                        if (name.isNotEmpty &&
                            mathScore != null &&
                            physicsScore != null &&
                            chemistryScore != null) {
                          final averageScore =
                              (mathScore + physicsScore + chemistryScore) / 3;
                          studentcontrollerX.addStudent(Student(
                              id: studentcontrollerX.generateId(),
                              name: name,
                              toan: mathScore,
                              ly: physicsScore,
                              hoa: chemistryScore
                              // Sử dụng ảnh mặc định nếu không có ảnh
                              ));
                        }
                        _nameText.clear();
                        _mathText.clear();
                        _physicText.clear();
                        _chemistryText.clear();
                      },
                      child: Text('Save'))
                ],
              ),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

class OtherScreen extends StatelessWidget {
  final StudentcontrollerX otherStudent = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Obx(
            () => Text(
              'heloo',
              style: TextStyle(fontSize: 30, color: Colors.redAccent),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // otherCounter.add();
              // Get.back();
            },
            child: Icon(Icons.add)));
  }
}
