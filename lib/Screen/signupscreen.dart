import 'package:firebase_app/Helper/auth_helper.dart';
import 'package:firebase_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                SizedBox(height: 100,),
                Text("Create Account",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5
                  ),
                ),
                SizedBox(height: 2,),
                Text("Please fill the input blow here",
                  style: GoogleFonts.poppins(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.23                ),
                ),
                SizedBox(height: 40,),

                //========= Name ==============

                TextFormField(

                  validator: (val){
                    if(val!.isEmpty)
                    {
                      return "Please Enter The Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined,
                      color: Colors.grey.shade400,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Name",
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

                //========= Email ==============

                SizedBox(height: 30,),

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

                //========= password ==============

                SizedBox(height: 30,),

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

                //========= Sign up Button ==============

                SizedBox(height: 40,),

                GestureDetector(
                  onTap: (){
                    if(validateKey.currentState!.validate())
                    {
                      print("done");
                      instance.signUpData(context);
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
                      child: Text("Sign Up",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 0.5
                        ),
                      ),
                    ),
                  ),
                ),

                //========= Sign In Button ==============

               Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom:8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: GoogleFonts.poppins(
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.w300,
                              fontSize: 14
                          )
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'logIn');
                          Auth.email.clear();
                          Auth.pass.clear();
                        },
                        child: Text("Sign In",
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
