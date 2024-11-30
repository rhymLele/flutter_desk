import 'package:cent/auth_fire/widgets/button_widget.dart';
import 'package:cent/auth_fire/widgets/squareTitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:cent/auth_fire/widgets/textField_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final userNameController = TextEditingController();
  final passWordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //logo
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Container(
                  height: 100,
                  child: Icon(
                    Icons.lock,
                    size: 100,
                  ),
                ),
              )
              //welcome back, youre been missed
              ,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Welcome back you\'re been missed',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ),
              //username textfield
              TextFieldWidget(
                  controller: userNameController,
                  hintText: 'Username',
                  obscureText: false),
              TextFieldWidget(
                  controller: passWordController,
                  hintText: 'Password',
                  obscureText: true),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                onTap: signUserIn,
              )
              //password textfield
              ,
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                   const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or continue with'),
                    ),
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTitleWidget(imgPath: 'assets/images/747.png'),
                    SizedBox(width: 20,),
                    SquareTitleWidget(imgPath: 'assets/images/gg_ic.png')
                  ],
                ),
              ),
             const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('not a member?'),
                  SizedBox(width: 4,)
                  ,Text('Register now',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),)
                ],
              )
              //forgot password

              //sign in button

              //or continue with

              //google + apple sign in buttons

              //not a member?
            ],
          ),
        ),
      ),
    );
  }
}
