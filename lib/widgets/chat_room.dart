import 'package:flutter/material.dart';
import 'chat_message.dart';

class ChatRoom extends StatelessWidget {
  final List<String> messages;
  final List<String> users;

  const ChatRoom({super.key, required this.messages, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final username = users[index];
        final isMe = username == 'me';

        return ChatMessage(
          text: message,
          username: username,
          isMe: isMe,
        );
      },
    );
  }
}