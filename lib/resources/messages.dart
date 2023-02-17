import 'package:flutter/foundation.dart';


class Messages with ChangeNotifier {
  final List<String> _messages = [];

  List<String> get messages => [..._messages];

  void addMessage(String message) {
    _messages.add(message);
    notifyListeners();
  }

  void deleteMessage(String message) {
    _messages.remove(message);
    notifyListeners();
  }
}