import 'package:firebase_app/Helper/databasehelper.dart';
import 'package:firebase_app/Screen/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helper/auth_helper.dart';
import '../utils/global.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GlobalKey<FormState> validateKey = GlobalKey<FormState>();
  AuthHelper instance = AuthHelper.authHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Form(
            key: validateKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120,),
                Text("Login",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5
                  ),
                ),
                SizedBox(height: 5,),
                Text("Please Sign in to continue",
                  style: GoogleFonts.poppins(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2
                  ),
                ),
                SizedBox(height: 40,),

                //========= Email ==============

                TextFormField(
                  controller: Auth.email,
                  validator: (val){
                    if(val!.isEmpty)
                    {
                      return "Please Enter The Email";
                    }
                    else if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(val)){
                      return "Please Enter A Valid Email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined,
                      color: Colors.grey.shade400,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Email",
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //========= Password ==============

                SizedBox(height: 40,),

                TextFormField(
                  controller: Auth.pass,
                  validator: (val){
                    if(val!.isEmpty)
                    {
                      return "Please Enter The Password";
                    }
                    else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(val)){
                      return "Please Enter A Valid Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded,
                      color: Colors.grey.shade400,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Password",
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w600,
                    ),
                    // label: Text("Password",
                    //   style: GoogleFonts.poppins(
                    //     color: Colors.grey.shade400,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //========= Log In Button ==============

                SizedBox(height: 40,),

                GestureDetector(
                  onTap: (){
                    if(validateKey.currentState!.validate())
                    {
                      instance.signInData(context);
                      Auth.email.clear();
                      Auth.pass.clear();
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 230,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60)
                      ),
                      alignment: Alignment.center,
                      child: Text("Login",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 0.5
                        ),
                      ),
                    ),
                  ),
                ),

                //========= Forgot Button ==============


                Center(
                  child: TextButton(
                    child: Text("Forgot Password?",
                      style: GoogleFonts.poppins(
                          color: Colors.white
                      ),
                    ),
                    onPressed: (){},
                  ),
                ),

                SizedBox(height: 10,),

                Center(
                  child: Text("Or",
                    style: GoogleFonts.poppins(
                        color: Colors.grey.shade200,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5
                    ),
                  ),
                ),

                //========= Google Button ==============

                SizedBox(height: 20,),

                Center(
                  child: GestureDetector(
                    onTap: (){
                      instance.googleData();
                    },
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage('images/googlo_logo-re.png'),
                          height: 40,
                        )
                    ),
                  ),
                ),

                //========= Sign Up Button ==============

                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: GoogleFonts.poppins(
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.w300,
                              fontSize: 14
                          )
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'signup');
                          Auth.email.clear();
                          Auth.pass.clear();
                        },
                        child: Text("Sign up",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14
                            )
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
