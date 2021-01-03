import 'package:flutter/material.dart';

class BlogInheritedWidget extends InheritedWidget {
  final notes = [
    {
      'title': 'Add Blog Title',
      'text': '• Tap the + Icon to Add Blog.\n• Tap the Card to Edit Blog.'
    },
  ];

  BlogInheritedWidget(Widget child) : super(child: child);

  static BlogInheritedWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<BlogInheritedWidget>());
  }

  @override
  bool updateShouldNotify(BlogInheritedWidget oldWidget) {
    return true;
  }
}
