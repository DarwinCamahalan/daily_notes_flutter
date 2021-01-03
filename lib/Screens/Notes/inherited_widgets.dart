import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {
  final notes = [
    {'title': 'Add Note Now', 'text': 'fdsfsf'},
    {'title': 'dasdadaddadada', 'text': 'dsfsdfsfsfs'},
    {'title': 'dasdadaddadada', 'text': 'dsfsdfsfsfs'},
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
