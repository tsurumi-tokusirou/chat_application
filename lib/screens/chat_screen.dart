import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/chat_room.dart';
import '../widgets/user_avatar.dart';
import '../services/messaging.dart';
import '../resources/messages.dart';
import '../resources/users.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: <Widget>[
          Consumer<Users>(
            builder: (context, users, child) => UserAvatar(
              users: users.users,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer2<Messages, Users>(
              builder: (context, messages, users, child) => ChatRoom(
                messages: messages.messages,
                users: users.users,
              ),
            ),
          ),
          const Divider(
            height: 1.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: const TextComposer(),
          ),
        ],
      ),
      
    );
  }
}

class TextComposer extends StatefulWidget {
  const TextComposer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final _textController = TextEditingController();

  void _reset() {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).canvasColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: (String text) {
                  Provider.of<Messages>(context, listen: false).addMessage(text);
                  Provider.of<MessagingService>(context, listen: false)
                      .sendMessage(text);
                  _reset();
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  Provider.of<Messages>(context, listen: false)
                      .addMessage(_textController.text);
                  Provider.of<MessagingService>(context, listen: false)
                      .sendMessage(_textController.text);
                  _reset();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}