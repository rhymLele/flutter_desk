
import 'dart:async';
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
  @override
  State<MyAppA> createState() => _MyAppAState();

}

class _MyAppAState extends State<MyAppA> {
  AddToCartAnimationManager manager=AddToCartAnimationManager();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    manager.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor: kColorPrimary,

      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.indigo.shade200,
        floatingActionButton: CartButton(),
        body: Stack(children: [ProductList(manager: manager,),
        ListenableBuilder(
          listenable: manager.productSize,
          builder: (context,_) {
            return Container(width: manager.productSize.value.width,height: manager.productSize.value.height,color: Colors.indigo.shade400,);
          }
        )]),
      ),
    );
  }
}
class AddToCartAnimationManager{
  final productKeys=List.generate(20, (index)=>GlobalKey());
  var productSize=ValueNotifier(Size(0, 0));
  void dispose(){
    productSize.dispose();
  }
}
