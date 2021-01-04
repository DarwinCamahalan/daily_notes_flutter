import 'package:daily_note/Screens/Notes/inherited_widgets.dart';
import 'package:daily_note/Screens/Notes/note_provider.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NoteMode { Editing, Adding }

class AddNotes extends StatefulWidget {
  final NoteMode noteMode;
  final Map<String, dynamic> note;
  AddNotes(this.noteMode, this.note);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _textController.text = widget.note['text'];
    }

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Note',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        actions: [
          GestureDetector(
            onTap: () {
              final title = _titleController.text;
              final text = _textController.text;
              if (widget?.noteMode == NoteMode.Adding) {
                NoteProvider.insertNote({
                  'title': title,
                  'text': text,
                });
              } else if (widget?.noteMode == NoteMode.Editing) {
                NoteProvider.updateNote({
                  'id': widget.note['id'],
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
          widget.noteMode == NoteMode.Editing
              ? _NoteButton(() async {
                  await NoteProvider.deleteNote(widget.note['id']);
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
              "assets/images/add_note_background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'Note Title'),
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
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final Function _onPressed;
  _NoteButton(this._onPressed);
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
