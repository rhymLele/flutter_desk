
import 'dart:async';
import 'package:cent/gemini_cb/sceens/home_sceen.dart';
import 'package:cent/gemini_cb/widgets/chat_bubble_widget.dart';
import 'package:cent/sources/codeSunday/cart/widgets.dart';
import 'package:cent/sources/codeSunday/fe_e/homepage.dart';
import 'package:cent/sources/codeSunday/fe_e/utils/theme.dart';
import 'package:cent/ui/splash/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
Future<void> main() async {
  // runApp(const MyApp());
  // runApp(ChangeNotifierProvider(
  //   create: (context) => mySettings(), child: MaterialApp(home: MyApp()),));
  // runApp(GetMaterialApp(home: Home()));
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context)=>MyAppA(),
  ));
}
class MyAppA extends StatefulWidget {
  const MyAppA({super.key});

  @override
  State<MyAppA> createState() => _MyAppAState();
}

class _MyAppAState extends State<MyAppA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: ChatBubble(message: 'Hello Girl', isMine: 2>1, photoUrl: 'assets/images/img_ava1.jpg'),
      ) ,

    );
  }
}


