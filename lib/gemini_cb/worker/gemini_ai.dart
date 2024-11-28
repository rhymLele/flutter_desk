import 'dart:async';

import 'package:google_generative_ai/google_generative_ai.dart';

const apiKey = 'AIzaSyC-tJIhmEs4XzrAjnXKsZtR5eP0tQfKxtQ';

class Gemini {
  late final GenerativeModel _model;
  final List<ChatContent> _content=[];
  final StreamController<List<ChatContent>> _streamController=StreamController.broadcast();
   Stream<List<ChatContent>> get stream =>_streamController.stream;
  Gemini() {
    if(apiKey==null)return;
    _model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  }

  void sendToGemini(String mess) async {
    try {
      _content.add(ChatContent.user(mess));
      _streamController.sink.add(_content);
     final res= await _model.generateContent([Content.text(mess)]);
     final String? text=res.text;
     if(text==null)
       {
         _content.add(ChatContent.gemini("Unable to answer"));
       }else{
       _content.add(ChatContent.gemini(text));
     }
     _streamController.sink.add(_content);
    } catch (e) {
      _content.add(ChatContent.gemini("Unable to answer"));
    }
  }
}

enum Sender { user, gemini }

class ChatContent {
  final Sender sender;
  final String mess;

  ChatContent.user(this.mess) : sender = Sender.user;

  ChatContent.gemini(this.mess) : sender = Sender.gemini;
}
