import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   List<Widget> _pages=[];
  var _index=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages=[
      Container(color: Colors.red,),
      Container(color: Colors.blue,),
      Container(color: Colors.cyan,),
      Container(color: Colors.greenAccent,),
      Container(color: Colors.white,)
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: _pages.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xFF8687E7),
          backgroundColor: const Color(0xFF363636),
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
           setState(() {
              if(index==2) return;
             _index=index;
           });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.fill,
                ),
                label: "index",
                activeIcon: Image.asset(
                  'assets/icons/home.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.fill,
                  color: Color(0xFF8687E7),
                ),
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/calendar.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.fill,
                ),
                label: "calendar",
                activeIcon: Image.asset(
                  'assets/icons/calendar.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.fill,
                  color: Color(0xFF8687E7),
                ),
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Container(),
                label: "",
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/timer.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.fill,
                ),
                label: "clock",
                activeIcon: Image.asset(
                  'assets/icons/timer.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.fill,
                  color: Color(0xFF8687E7),
                ),
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/profile.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.fill,
                ),
                label: "profile",
                activeIcon: Image.asset(
                  'assets/icons/profile.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.fill,
                  color: Color(0xFF8687E7),
                ),
                backgroundColor: Colors.transparent)
          ]),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: Color(0xFF8687E7),
          borderRadius: BorderRadius.circular(32)
        ),
        child: IconButton(
          onPressed: (){},
          icon: Icon(Icons.add,size: 30,color: Colors.white,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
