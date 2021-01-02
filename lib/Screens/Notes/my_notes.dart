import 'package:daily_note/Screens/Notes/add_notes.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyNotes());

class MyNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      home: Scaffold(
        backgroundColor: kPrimaryLightColor,
        drawer: new Drawer(),
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('My Notes'),
        ),
        body: ListView.builder(
          // itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddNotes(NoteMode.Editing);
                    },
                  ),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, right: 10, left: 10, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _NoteTitle(),
                      _NoteText(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddNotes(NoteMode.Adding);
                },
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Title',
      style: GoogleFonts.lato(fontSize: 25),
    );
  }
}

class _NoteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Text',
      style: GoogleFonts.lato(
        color: Colors.grey.shade700,
      ),
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
    );
  }
}
