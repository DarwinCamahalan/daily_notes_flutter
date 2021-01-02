import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';

enum NoteMode { Editing, Adding }

class AddNotes extends StatelessWidget {
  final NoteMode _noteMode;
  AddNotes(this._noteMode);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text(_noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Note'),
        backgroundColor: kPrimaryColor,
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
          _noteMode == NoteMode.Editing ? _NoteButton(() {}) : Container(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
            ),
            Expanded(
              child: TextField(
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
