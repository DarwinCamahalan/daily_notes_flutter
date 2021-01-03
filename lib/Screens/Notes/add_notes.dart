import 'package:daily_note/Screens/Notes/inherited_widgets.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';

enum NoteMode { Editing, Adding }

class AddNotes extends StatefulWidget {
  final NoteMode noteMode;
  final index;
  AddNotes(this.noteMode, this.index);

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
      _titleController.text = _notes[widget.index]['title'];
      _textController.text = _notes[widget.index]['text'];
    }

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title:
            Text(widget.noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Note'),
        backgroundColor: kPrimaryColor,
        actions: [
          MaterialButton(
            onPressed: () {
              final title = _titleController.text;
              final text = _textController.text;
              if (widget?.noteMode == NoteMode.Adding) {
                _notes.add({
                  'title': title,
                  'text': text,
                });
              } else if (widget?.noteMode == NoteMode.Editing) {
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
          widget.noteMode == NoteMode.Editing
              ? _NoteButton(() {
                  _notes.removeAt(widget.index);
                  Navigator.pop(context);
                })
              : Container(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
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
              ),
            ),
          ],
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