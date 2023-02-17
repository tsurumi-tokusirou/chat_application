import 'package:flutter/foundation.dart';

class Users with ChangeNotifier {
  final List<String> _users = [];

  List<String> get users => [..._users];

  void addUser(String user) {
    _users.add(user);
    notifyListeners();
  }

  void deleteUser(String user) {
    _users.remove(user);
    notifyListeners();
  }
}