import 'package:cent/gemini_cb/widgets/chat_bubble_widget.dart';
import 'package:cent/gemini_cb/widgets/message_box_widget.dart';
import 'package:cent/gemini_cb/worker/gemini_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _MyAppAState();
}

class _MyAppAState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    final Gemini _worker=Gemini();
    return MaterialApp(
      home: Scaffold(
        body:SafeArea(
          child: Column(
            children: [
              Expanded(child:StreamBuilder<List<ChatContent>>(
                stream: _worker.stream,
                builder: (context, snapshot) {
                  final List<ChatContent> data=snapshot.data??[];
                  return ListView(children: data.map((e)=> ChatBubble(message: e.mess, isMine: e.sender==Sender.user, photoUrl: 'assets/images/img_ava1.png')).toList());
                }
              ), ),
              MessageBox(onSendMessage: (value){
                print('$value');
              },)
            ],
          ),
        ) ,

      ),
    );
  }
}


