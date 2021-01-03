import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {
  final notes = [
    {
      'title': 'Instructions',
      'text': '• Tap the + Icon to Add Note.\n• Tap the Card to Edit Note.'
    },
  ];

  NoteInheritedWidget(Widget child) : super(child: child);

  static NoteInheritedWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<NoteInheritedWidget>());
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    return true;
  }
}
