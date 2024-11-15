//class cha
import 'package:cent/ui/onboading/onboading_child_page.dart';
import 'package:cent/ui/welcome/welcome_page.dart';
import 'package:cent/ultils/enums/onboading_page_positions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboadingPageView extends StatefulWidget {
  const OnboadingPageView({super.key});

  @override
  State<OnboadingPageView> createState() => _OnboadingPageViewState();
}

class _OnboadingPageViewState extends State<OnboadingPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboadingChildPage(
            onboadingPagePositions: OnboadingPagePositions.page1,
            nextOnPressed: () {
              _pageController.jumpToPage(1);
            },
            backOnPressed: () {},
            skipkOnPressed: skiped,
          ),
          OnboadingChildPage(
            onboadingPagePositions: OnboadingPagePositions.page2,
            nextOnPressed: () {
              _pageController.jumpToPage(2);
            },
            backOnPressed: () {
              _pageController.jumpToPage(0);
            },
            skipkOnPressed: skiped,
          ),
          OnboadingChildPage(
            onboadingPagePositions: OnboadingPagePositions.page3,
            nextOnPressed: () {
              // _pageController.jumpToPage(3);
              _markOnboadingCompleted();
              skiped();
            },
            backOnPressed: () {
              _pageController.jumpToPage(1);
            },
            skipkOnPressed: skiped,

          )
        ],
      ),
    );
  }

  void skiped() {
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context)=>const WelcomePage())
     );
     _markOnboadingCompleted();
  }
  Future<void> _markOnboadingCompleted() async{
    try{
      final SharedPreferences prefs= await SharedPreferences.getInstance();
      prefs.setBool('kOnboadingCompleted',true);
    }catch(e){
      print(e);
    }
  }
}
