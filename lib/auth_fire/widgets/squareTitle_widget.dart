
import 'package:flutter/material.dart';

class SquareTitleWidget extends StatelessWidget {
  const SquareTitleWidget({super.key, required this.imgPath});
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
          color: Colors.grey[200]
      ) ,
      child: Image.asset(imgPath,height: 20,width: 20,),
    );
  }
}
