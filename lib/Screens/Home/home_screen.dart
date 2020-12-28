import 'package:flutter/material.dart';
import 'package:daily_note/Screens/Home/components/body.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}
