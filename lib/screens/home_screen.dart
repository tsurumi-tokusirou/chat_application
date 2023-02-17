import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:  Center(
        child: ChatScreen()
      ),  
    );
  }
}
