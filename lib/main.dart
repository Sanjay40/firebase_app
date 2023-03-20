import 'package:firebase_app/Screen/authstatechange.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screen/homescreen.dart';
import 'Screen/loginscreen.dart';
import 'Screen/signupscreen.dart';
import 'Screen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      routes: {
        '/' : (context) => const SplashScreen(),
        'authState': (context) => const AuthStateChange(),
        'logIn': (context) => const LogInScreen(),
        'signup': (context) => const SignUpScreen(),
        'home': (context) => const HomeScreen()
      },
    )
  );
}