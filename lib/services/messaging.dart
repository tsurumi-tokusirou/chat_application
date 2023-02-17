import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class MessagingService with ChangeNotifier {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> sendMessage(String message) async {
    await _messaging.getToken(
      
    );
    notifyListeners();
  }
}

