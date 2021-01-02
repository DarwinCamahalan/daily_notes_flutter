import 'package:daily_note/Screens/Notes/my_notes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyNotes(),
    );
  }
}
