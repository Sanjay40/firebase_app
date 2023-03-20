import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/global.dart';

class DatabaseHelper{
  static DatabaseHelper dbHelper = DatabaseHelper();
  CollectionReference users = FirebaseFirestore.instance.collection('Data');

  insert(){
    return users.add({
      'Name': Auth.name.text,
      'age': Auth.age.text
    }).then((value) => print("data Add")).onError((error, stackTrace) => print("error : ${error}"));
  }
}