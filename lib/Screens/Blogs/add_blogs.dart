import 'package:daily_note/Screens/Blogs/inherited_widgets.dart';
import 'package:daily_note/Screens/Blogs/note_provider.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum BlogMode { Editing, Adding }

class AddBlogs extends StatefulWidget {
  final BlogMode blogMode;
  final Map<String, dynamic> blog;
  AddBlogs(this.blogMode, this.blog);

  @override
  _AddBlogsState createState() => _AddBlogsState();
}

class _AddBlogsState extends State<AddBlogs> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  List<Map<String, String>> get _notes => BlogInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if (widget.blogMode == BlogMode.Editing) {
      _titleController.text = widget.blog['title'];
      _textController.text = widget.blog['text'];
    }

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.blogMode == BlogMode.Adding ? 'Add Blog' : 'Edit Blog',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              final title = _titleController.text;
              final text = _textController.text;
              if (widget?.blogMode == BlogMode.Adding) {
                BlogProvider.insertBlog({
                  'title': title,
                  'text': text,
                });
              } else if (widget?.blogMode == BlogMode.Editing) {
                BlogProvider.updateBlog({
                  'id': widget.blog['id'],
                  'title': _titleController.text,
                  'text': _textController.text,
                });
              }
              Navigator.pop(context);
            },
            child: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
          widget.blogMode == BlogMode.Editing
              ? _BlogButton(() async {
                  await BlogProvider.deleteBlog(widget.blog['id']);
                  Navigator.pop(context);
                })
              : Container(
                  width: 30,
                ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/add_blog_background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
                controller: _titleController,
                decoration: InputDecoration(hintText: 'Blog Title'),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Container(
                height: 10,
              ),
              Expanded(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _textController,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: 'Add Text Here...'),
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlogButton extends StatelessWidget {
  final Function _onPressed;
  _BlogButton(this._onPressed);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: _onPressed,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
