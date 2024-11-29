import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget(
      {super.key, required this.taskName, required this.taskCompleted, this.onChanged, this.deleteFunc});

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 0
      ),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(), children: [SlidableAction(onPressed:

        deleteFunc,icon:Icons.delete ,borderRadius: BorderRadius.circular(16),backgroundColor: Colors.redAccent,)
        ]),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.deepPurple
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.black38,
                activeColor: Colors.white,
                side: const BorderSide(color: Colors.white),),
              Text(taskName, style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none
                ,
                decorationColor: Colors.deepPurpleAccent,
                decorationThickness: 2,
              ), maxLines: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
