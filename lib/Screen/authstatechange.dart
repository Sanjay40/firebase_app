import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'loginscreen.dart';

class AuthStateChange extends StatefulWidget {
  const AuthStateChange({Key? key}) : super(key: key);

  @override
  State<AuthStateChange> createState() => _AuthStateChangeState();
}

class _AuthStateChangeState extends State<AuthStateChange> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder:( context,snapshot){
        if(snapshot.hasData){
          return HomeScreen();
        }
        else{
          return LogInScreen();
        }
      },
    );
  }
}
