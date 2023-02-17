
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'services/authentication.dart';
import 'resources/users.dart';
import 'resources/messages.dart';
import 'firebase_options.dart';


 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
runApp( MultiProvider(
   providers: [
     ChangeNotifierProvider<AuthenticationService>(create: (context) => AuthenticationService()),
     ChangeNotifierProvider<Users>(create: (context) => Users()),
     ChangeNotifierProvider<Messages>(create: (context) => Messages()),
   ], 
   child: const MyApp(),
 ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ChangeNotifierProvider<AuthenticationService>(
          create: (context) {
            return AuthenticationService();
          },
          child: child,
        );
      },
      home: const LoginScreen(),
    );

  }
}
