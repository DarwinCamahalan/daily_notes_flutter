import 'package:daily_note/Screens/Blogs/inherited_widgets.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum BlogMode { Editing, Adding }

class AddBlogs extends StatefulWidget {
  final BlogMode noteMode;
  final index;
  AddBlogs(this.noteMode, this.index);

  @override
  _AddBlogsState createState() => _AddBlogsState();
}

class _AddBlogsState extends State<AddBlogs> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  List<Map<String, String>> get _notes => BlogInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if (widget.noteMode == BlogMode.Editing) {
      _titleController.text = _notes[widget.index]['title'];
      _textController.text = _notes[widget.index]['text'];
    }

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.noteMode == BlogMode.Adding ? 'Add Blog' : 'Edit Blog',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              final title = _titleController.text;
              final text = _textController.text;
              if (widget?.noteMode == BlogMode.Adding) {
                _notes.add({
                  'title': title,
                  'text': text,
                });
              } else if (widget?.noteMode == BlogMode.Editing) {
                _notes[widget.index] = {
                  'title': title,
                  'text': text,
                };
              }
              Navigator.pop(context);
            },
            child: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
          widget.noteMode == BlogMode.Editing
              ? _BlogButton(() {
                  _notes.removeAt(widget.index);
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
