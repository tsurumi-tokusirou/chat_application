import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/authentication.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Login and register'),
            const SizedBox(height: 10.0),
            TextFormField(
            decoration: const InputDecoration(
            labelText: 'email'
            ),
            ),
            TextFormField(
            decoration: const InputDecoration(
            labelText: 'password'
            ),
            ),
            Consumer<AuthenticationService>(
              builder: (context, authentication, child) => ElevatedButton(
                child: const Text('Login'),
                onPressed: () async{
                  await authentication.login('email', 'password');
                },
              ),
            ),
            const SizedBox(height: 10.0),
            
            Consumer<AuthenticationService>(
              builder: (context, authentication, child) => ElevatedButton(
                child: const Text('SignUp'),
                onPressed: () async{
                  await authentication.register('email', 'password');
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
