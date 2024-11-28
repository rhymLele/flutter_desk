import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isMine,
      required this.photoUrl});

  final String message;
  final bool isMine;
  final String? photoUrl;
  final double _iconSize=24.0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    widgets.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_iconSize),
        child: photoUrl == null
            ? _defaultWidget(_iconSize)
            : CachedNetworkImage(
                imageUrl: photoUrl!,
                width: 26,
                height: 26,
                fit: BoxFit.fitWidth,
                errorWidget: (context, url, error) => _defaultWidget(_iconSize),
                placeholder: (context, url) => _defaultWidget(_iconSize),
              ),
      ),
    ));
    widgets.add(Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width*0.7
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isMine ? Colors.black26 : Colors.black87),
      child: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      ),
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(8.0),

    ));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0 ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: isMine ? MainAxisAlignment.end:MainAxisAlignment.start,
        children: isMine ? widgets.reversed.toList() : widgets,
      ),
    );
  }
}

Widget _defaultWidget(double size) {
  return Icon(Icons.person_2, color: Colors.black, size: size);
}
