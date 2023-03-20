import 'dart:async';

import 'package:firebase_app/Screen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState()
  {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, 'authState'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black,
        ),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 230,),
              DelayedDisplay(
                delay: Duration(seconds: 1),
                child: Image(
                  image: AssetImage('images/mobile-login.png',),
                  height: 280,
                ),
              ),
              SizedBox(height: 230,),
              DelayedDisplay(
                delay: Duration(seconds: 1),
                child: Text("Start your journey here!",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
