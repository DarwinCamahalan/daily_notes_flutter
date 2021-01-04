import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Business());

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.orange[100],
      ),
      title: 'Business',
      home: Scaffold(
        backgroundColor: kPrimaryLightColor,
        drawer: new Drawer(
            child: Container(
                color: Colors.orangeAccent[100], child: new ListView())),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: kPrimaryColor,
          title: Text(
            'Business',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'), // START HERE
          ),
        ),
      ),
    );
  }
}
