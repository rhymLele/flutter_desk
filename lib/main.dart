
import 'dart:async';
import 'package:cent/sources/event_app/event/event_view.dart';
import 'package:cent/ui/splash/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
    builder: (context) => MyAppA(), // Wrap your app
  ),);
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('vi'),
        Locale('en')
      ],
      locale:  const Locale('vi'),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: EventView(),
    );
  }
}

class MyAppA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}