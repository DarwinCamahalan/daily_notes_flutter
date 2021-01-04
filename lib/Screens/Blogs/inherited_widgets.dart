import 'package:flutter/material.dart';

class BlogInheritedWidget extends InheritedWidget {
  BlogInheritedWidget(Widget child) : super(child: child);

  static BlogInheritedWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<BlogInheritedWidget>());
  }

  @override
  bool updateShouldNotify(BlogInheritedWidget oldWidget) {
    return true;
  }
}
