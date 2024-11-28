import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({required this.onSendMessage,super.key});
  final ValueChanged<String> onSendMessage;
  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final TextEditingController _Nhap = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _Nhap.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _Nhap,
        maxLines: 1,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide:
                    const BorderSide(color: Colors.black38, width: 1.0)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            suffix: IconButton(
              onPressed: () {
                widget.onSendMessage(_Nhap.text);
                _Nhap.clear();
              },icon: Icon(Icons.send),
            )),
        onSubmitted: (value) {
          widget.onSendMessage(value);
          _Nhap.clear();
        },
      ),
    );
  }
}
