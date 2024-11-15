import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'student.dart';
import 'studentController.dart';

class StudentScreen extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());

  late final TextEditingController nameController;
  late final TextEditingController mathController;
  late final TextEditingController physicsController;
  late final TextEditingController chemistryController;

  String? imagePath; // Đường dẫn ảnh
  final String defaultImagePath = 'assets/default_image.png'; // Đường dẫn ảnh mặc định

  void _initializeControllers() {
    nameController = TextEditingController();
    mathController = TextEditingController();
    physicsController = TextEditingController();
    chemistryController = TextEditingController();
  }

  StudentScreen() {
    _initializeControllers(); // Gọi hàm khởi tạo các controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh Sách Sinh Viên'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: studentController.students.length,
                itemBuilder: (context, index) {
                  final student = studentController.students[index];
                  return ListTile(


                    title: Text(student.name),
                    subtitle: Text(
                      ' TB: ${student.averageScore}',
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Tên'),
                ),
                TextField(
                  controller: mathController,
                  decoration: InputDecoration(labelText: 'Điểm Toán'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: physicsController,
                  decoration: InputDecoration(labelText: 'Điểm Lý'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: chemistryController,
                  decoration: InputDecoration(labelText: 'Điểm Hóa'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){

                  }, // Gọi phương thức chọn ảnh
                  child: Text(imagePath == null ? 'Chọn Ảnh' : 'Ảnh đã chọn'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final mathScore = double.tryParse(mathController.text);
                    final physicsScore = double.tryParse(physicsController.text);
                    final chemistryScore = double.tryParse(chemistryController.text);

                    if (name.isNotEmpty &&
                        mathScore != null &&
                        physicsScore != null &&
                        chemistryScore != null) {
                      final averageScore = (mathScore + physicsScore + chemistryScore) / 3;
                      studentController.addStudent(Student(
                        id: studentController.generateId(),
                        name: name,
                        mathScore: mathScore,
                        physicsScore: physicsScore,
                        chemistryScore: chemistryScore,
                        averageScore: averageScore,
                        imageUrl: imagePath ?? defaultImagePath, // Sử dụng ảnh mặc định nếu không có ảnh
                      ));

                      // Xóa trường nhập liệu
                      nameController.clear();
                      mathController.clear();
                      physicsController.clear();
                      chemistryController.clear();
                      imagePath = null; // Đặt lại đường dẫn ảnh
                    }
                  },
                  child: Text('Thêm Sinh Viên'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}