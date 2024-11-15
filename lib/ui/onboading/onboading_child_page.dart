//class con
import 'package:cent/ultils/enums/onboading_page_positions.dart';
import 'package:flutter/material.dart';

class OnboadingChildPage extends StatelessWidget {
  const OnboadingChildPage({super.key,required this.onboadingPagePositions, required this.nextOnPressed, required this.backOnPressed, required this.skipkOnPressed});
  final OnboadingPagePositions onboadingPagePositions;
  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed;
  final VoidCallback skipkOnPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSkipButton(),
              _buildOnboadingImage(),
              _buildOnboadingPageControl(),
              _buildOnboadingTitleandContent(),
              _buildOnboadingNextandPreButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
          onPressed: () {
            skipkOnPressed();
          },
          child: Text(
            'Skip',
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Lato",
                color: Colors.white.withOpacity(0.44)),
          )),
    );
  }

  Widget _buildOnboadingImage() {
    return Image.asset(
      onboadingPagePositions.onboadingPageImage(),
      height: 296,
      width: 271,
      fit: BoxFit.contain,
    );
  }

  Widget _buildOnboadingPageControl() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 4,
          width: 26,
          decoration: BoxDecoration(
              color:onboadingPagePositions==OnboadingPagePositions.page1?Colors.white: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56)),
        ),
        Container(
          height: 4,
          width: 26,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: onboadingPagePositions==OnboadingPagePositions.page2?Colors.white: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56)),
        ),
        Container(
          height: 4,
          width: 26,
          decoration: BoxDecoration(
              color: onboadingPagePositions==OnboadingPagePositions.page3?Colors.white: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(56)),
        )
      ],
    ));
  }

  Widget _buildOnboadingTitleandContent() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              onboadingPagePositions.onboadingPageTitle(),
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 42,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              onboadingPagePositions.onboadingPageContent(),
              style:
                  TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOnboadingNextandPreButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24).copyWith(top: 107),
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                backOnPressed();
              },
              child: Text(
                "BACK",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Lato",
                  color: Colors.white.withOpacity(0.44),
                ),
              )),
          Spacer(

          ),
          ElevatedButton(
              onPressed: () {
                nextOnPressed.call();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8875FF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
              ),
              child: Text(
                onboadingPagePositions==OnboadingPagePositions.page3?"Get Started": "Next",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Lato",
                  color: Colors.white.withOpacity(0.44),
                ),
              ))
        ],
      ),
    );
  }
}
