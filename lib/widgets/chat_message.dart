import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String username;
  final bool isMe;

  const ChatMessage({super.key, required this.text, required this.username, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          !isMe
              ? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    child: Text(username[0]),
                  ),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMe ? Colors.white : Colors.black54,
                  ),
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(30.0),
                    bottomRight: const Radius.circular(30.0),
                    topLeft: isMe ? const Radius.circular(30.0) : Radius.zero,
                    topRight: isMe ? Radius.zero : const Radius.circular(30.0),
                  ),
                  color: isMe ? Theme.of(context).primaryColor : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: isMe ? Colors.white : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isMe
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    child: Text(username[0]),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}