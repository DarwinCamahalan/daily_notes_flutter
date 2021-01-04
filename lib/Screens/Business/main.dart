import 'package:flutter/material.dart';
import 'package:daily_note/Screens/Business/calendar.dart';
import 'package:daily_note/Screens/Business/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(Business());
}

class Business extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.isDarkTheme ? dark : light,
          home: Calendar(),
        );
      }),
    );
  }
}
