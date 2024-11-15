import 'package:flutter/material.dart';

class ListCV extends StatefulWidget {

  @override
  State<ListCV> createState() => _ListCVState();

}

class _ListCVState extends State<ListCV> {
  @override
  TextEditingController editingController=TextEditingController();
  final tasks=<String>[];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    editingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller:editingController ,
                decoration:InputDecoration(
                  labelText: 'Input Task Name'

                ),
              ),SizedBox(height: 20,)
              ,Expanded(child: ListView.builder(itemCount: tasks.length,
                itemBuilder:(context,index){
                return Container(
                  height: 40,
                  child: Text(tasks.elementAt(index).toString()),
                );

    }))
            ],
          ),
        ),
      ),floatingActionButton: FloatingActionButton(onPressed:(){
        setState(() {
          debugPrint(editingController.toString());
          tasks.add(editingController.toString());
        });
    },child: Icon(Icons.add),
    ));
  }
}
