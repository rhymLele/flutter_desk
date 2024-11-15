import 'package:flutter/material.dart';
import 'studentScreen.dart';
import 'package:get/get.dart';
import 'package:cent/sources/score.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản Lý Sinh Viên',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final counter = Get.put(Counter());
  late int _score;
  late int _fc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadScore();
    ScoreData.readScore().then((value){
      setState(() {
        _score=int.parse(value);
      });
    });
    counter.count=_score as RxInt;
  }
  void _loadScore() async{
    final prefs= await SharedPreferences.getInstance();
    setState(() {
      counter.count=prefs.getInt("score")! as RxInt ;


    });
  }
  @override
  Widget build(BuildContext context) {
    void _incre() async{
      final scoreData =await  SharedPreferences.getInstance();
      setState(() {
        scoreData.setInt('score', counter.count as int);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              '${counter.count}',
              style: TextStyle(fontSize: 52),
            )),
            ElevatedButton(
                onPressed: () {
                  Get.to(OtherScreen());
                },
                child: Text('Go to 2nd screen')),
            ElevatedButton(
                onPressed: () {
                  Get.to(FinalScreen());
                },
                child: Text('Go to final screen'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.add();
          _incre();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class FinalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Show Snackbar'),
                  onPressed: () {
                    Get.snackbar('Hi', 'JJ');
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Back'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  final Counter otherCounter = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Obx(
                () => Text(
              '${otherCounter.count}',
              style: TextStyle(fontSize: 30, color: Colors.redAccent),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              otherCounter.add();
              // Get.back();
            },
            child: Icon(Icons.add)));
  }
}class Counter extends GetxController {
  var count = 0.obs;

  void add() {
    count++;
  }
}
