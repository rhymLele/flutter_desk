
import 'package:cent/sources/codeSunday/fe_e/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: kColorPrimary,
        body: SafeArea(
            child: orientation == Orientation.portrait
                ? Stack(
                    children: [
                      Header(),
                      Middle(),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(child: Header()),
                      Expanded(child: Middle()),
                    ],
                  )));
  }
}

Widget Header() {
  return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
          heightFactor: 0.6,
          widthFactor: 1,
          child: FittedBox(
              fit: BoxFit.cover,
              child: SvgPicture.asset('assets/images/meditation_gr.svg'))));
}

Widget Middle() {
  return Column(children: [
    SvgPicture.asset('assets/images/mediation_logo.svg'),
    Text(
      'Hi Afsar, Welcome ',
      style: PrimaryFont.medium(30).copyWith(color: kColorLightYellow),
    ),
    Text('to Silent Moon', style: PrimaryFont.thin(30).copyWith(color: kColorLightYellow)),
    Text(
      'Explore the app, Find some peace of mind to prepare for meditation.',
      style: PrimaryFont.light(20).copyWith(color: kColorLightGrey),
    ),
  ]);
}
