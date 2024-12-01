import 'package:cent/auth_fire/screens/login_or_register_screen.dart';
import 'package:cent/auth_fire/screens/login_screen.dart';
import 'package:cent/todo_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder <User?>(
        stream: FirebaseAuth.instance.authStateChanges()
            ,
        builder: (context,snapshot){
          //User loged in
          if(snapshot.hasData) return HomeScreen();
          else return LoginOrRegister();
          //not log
        },
      ),
    );
  }
}
