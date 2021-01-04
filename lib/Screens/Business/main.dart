import 'package:daily_note/Screens/Business/business_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BusinessMainScreen());

class BusinessMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Business(),
    );
  }
}
