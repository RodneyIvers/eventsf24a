import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    testData();
    return MaterialApp(
      title: 'Events',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello98")
        ),
      ),
    );
  }

  Future testData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    var data = await db.collection('Events').get();
    var details = data.docs.toList();
    details.forEach((d) {
      print(d.id);
      print("testRFI");
    });
  }
}
