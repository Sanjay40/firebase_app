import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helper/databasehelper.dart';
import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper.dbHelper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 15,right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Home Page",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 22
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamedAndRemoveUntil(context, 'logIn', (route) => false);
                    },
                    child: Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              //========= Name ==============

              SizedBox(height: 40,),

              TextFormField(
                controller: Auth.name,
                validator: (val){
                  if(val!.isEmpty)
                  {
                    return "Please Enter The name";
                  }
                  return null;
                },
                decoration: InputDecoration(
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

              //========= Age ==============

              SizedBox(height: 20,),

              TextFormField(
                controller: Auth.age,
                validator: (val){
                  if(val!.isEmpty)
                  {
                    return "Please Enter The Age";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Age",
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

              //========= Insert ==============

              SizedBox(height: 40,),

              GestureDetector(
                onTap: (){
                  setState(() {
                    databaseHelper.insert();
                    Auth.name.clear();
                    Auth.age.clear();
                  });
                },
                child: Center(
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)
                    ),
                    alignment: Alignment.center,
                    child: Text("Insert",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          letterSpacing: 0.5
                      ),
                    ),
                  ),
                ),
              ),

              //========= Show Data ==============

              SizedBox(height: 20,),

              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('Data').snapshots(),
                      builder: (context,snapshot){
                        if(snapshot.hasError){
                            return Text("Something Went Wrong");
                          }
                        else if(snapshot.connectionState == ConnectionState.waiting){
                          return CircularProgressIndicator();
                         }
                          else{
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context,index){
                                  return ListTile(
                                    title: Text("${snapshot.data!.docs[index]['Name']}",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                      ),
                                    ),
                                    subtitle:Text("${snapshot.data!.docs[index]['age']}",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade600
                                    ),
                                    ),
                                  );
                                }
                            );
                        }
                        }
                    )
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
