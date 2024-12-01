import 'package:cent/todo_app/widgets/todo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todo = [
    ['Flutter', false],
    ['CC+', false],
  ];
  void checkBoxChanged(int index) {
    setState(() {
      todo[index][1] = !todo[index][1];
      print('a');
    });
  }
  late String? a;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a=user.email!.toString();
  }
  void saveNewTask(){
   setState(() {
     todo.add([_controller.text,false]);
     _controller.clear();
   });
  }
  void deleteFunction(int index)
  {
    setState(() {
      todo.removeAt(index);
    });
  }
  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController _controller=TextEditingController();
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,

      appBar: AppBar(
        title:  Text('Hello ${user.email ?? 'Guest'}'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
                itemCount: todo.length,
                itemBuilder: (BuildContext context, index) {
                  return TodoWidget(
                    taskName: todo[index][0],
                    taskCompleted: todo[index][1],
                    onChanged: (value) => checkBoxChanged(index),
                    deleteFunc: (context)=> deleteFunction(index),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16,right: 80,bottom: 16,left: 12),
            child: TextField(
              controller: _controller ,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.deepPurple.shade200,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                      ,borderSide:const BorderSide(
                  color:  Colors.deepPurple
                )
                ),focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.deepPurpleAccent
                ),borderRadius: BorderRadius.circular(15)
              )
              ),
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: saveNewTask,child:const Icon(Icons.add),),
    );
  }
}
