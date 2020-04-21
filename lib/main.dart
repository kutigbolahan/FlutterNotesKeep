import 'package:flutter/material.dart';
import 'package:notes_keep/screens/notedetails.dart';
import 'package:notes_keep/screens/notelist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFEAA4A4),
        canvasColor: Colors.white,//const Color(0xFFEAA4A4),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteDetails(),
    );
  }
}
