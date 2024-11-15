import 'package:get/get.dart';

class Student{
  // Properties
  String id;
  String name;

  double ly,toan,hoa;


  // Constructor
  Student({
    required this.id,
    required this.name,
    required this.toan,
    required this.ly,
    required this.hoa ,
  });

  void displayInfo() {
    print('Name: $name');

  }

  // Method to calculate the average score
}
