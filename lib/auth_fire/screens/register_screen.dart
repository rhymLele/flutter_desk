import 'package:cent/auth_fire/widgets/button_widget.dart';
import 'package:cent/auth_fire/widgets/squareTitle_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cent/auth_fire/widgets/textField_widget.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key, this.onTap});
  final Function()? onTap;
  @override
  State<RegisterScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<RegisterScreen> {
  final userNameController = TextEditingController();

  final passWordController = TextEditingController();
  final confirmPwController = TextEditingController();


  void signUserUp() async {
    try {
      showDialog(context: context, builder: (context){
        return Center(child:
        CircularProgressIndicator(),);
      });
      if(confirmPwController.text==passWordController.text){
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text.trim(),
          password: passWordController.text.trim(),
        );
      }else{
        showALert('Password!');
      }

      Navigator.pop(context);
      print('User logged in successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showALert('No user found for that email.');
        Navigator.pop(context);
      } else if (e.code == 'wrong-password') {
        showALert('Wrong password provided for that user.');
        Navigator.pop(context);
      } else {
        showALert(e.toString());
        Navigator.pop(context);
      }
    }

  }
  void showALert(String a ){
    showDialog(context: context, builder: (context){
      return  AlertDialog(
        title:Text(a) ,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //logo
                // const SizedBox(
                //   height: 30,
                // ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Icon(
                    Icons.lock,
                    size: 100,
                  ),
                )
                //welcome back, youre been missed
                ,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Let\'s join us to create your world',
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
                TextFieldWidget(
                    controller: confirmPwController,
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
                  onTap: signUserUp,
                  text: 'Sign Up',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already has an account'),
                    SizedBox(width: 4,)
                    ,GestureDetector(
                        onTap: widget.onTap,
                        child: Text('Log in now',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),))
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
      ),
    );
  }
}
