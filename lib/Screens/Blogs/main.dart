import 'package:daily_note/Screens/Blogs/inherited_widgets.dart';
import 'package:daily_note/Screens/Blogs/my_blogs.dart';
import 'package:flutter/material.dart';

void main() => runApp(BlogMainScreen());

class BlogMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlogInheritedWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyBlogs(),
      ),
    );
  }
}
