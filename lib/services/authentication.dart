import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class AuthenticationService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  
  Future<String> getCurrentUser() async {
    // Type cast the nullable FirebaseUser type to a non-null FirebaseUser type
    FirebaseUser user = (_auth.currentUser) as FirebaseUser; 
    // ignore: unnecessary_null_comparison
    if (user == null) {
      // Properly handle the null case here
      await _auth.createUserWithEmailAndPassword(email: 'email', password: 'password');
      notifyListeners();
      return user.uid;
    } else {
      // Handle the non-null case here
      return user.uid;
    }
  }
  
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

  Future<void>  register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }
}

class FirebaseUser {
  late Future<String> uid;
}
