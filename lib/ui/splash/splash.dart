import 'package:cent/ui/onboading/onboading_page_view.dart';
import 'package:cent/ui/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> _checkAppState(BuildContext context) async{
  final _isCompleted=await _isOnboadingCompleted();
  if(_isCompleted)
    {
      if(!context.mounted)
        {
          return;
        }
      //move to Welcome Screen
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>WelcomePage()));
    }else
      {
        if(!context.mounted)
        {
          return;
        }
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>OnboadingPageView()));
      }
  }
  Future<bool> _isOnboadingCompleted () async{
    try{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    final res=prefs.getBool('kOnboadingCompleted');
    return res?? false;
    }catch(e){
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    _checkAppState(context);
    return Scaffold(
      backgroundColor:const Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: _buildBody(),
        ),
      ),
    );
  }
  Widget _buildBody(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ImageSplash(),
        _TextSplash()
      ],
    );
  }
Widget _ImageSplash()
{
  return Image.asset(
    "assets/images/splash_ic.png",
    width: 95,
    height: 80,
    fit: BoxFit.contain,
  );
}
Widget _TextSplash()
{
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: const Text(
      "To DO",
      style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
  );
}

}
