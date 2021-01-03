import 'package:daily_note/Screens/Home/components/body.dart';
import 'package:daily_note/Screens/Notes/add_notes.dart';
import 'package:daily_note/Screens/Notes/inherited_widgets.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyNotes());

class MyNotes extends StatefulWidget {
  @override
  _MyNotesState createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

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
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddNotes(NoteMode.Editing, index)));
                setState(() {});
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, right: 10, left: 10, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _NoteTitle(_notes[index]['title']),
                      _NoteText(_notes[index]['text']),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: _notes.length,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddNotes(NoteMode.Adding, null)));
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.orange.shade400,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  }),
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.orange.shade400,
                  ),
                  onPressed: () {}),
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.settings_sharp,
                    color: Colors.orange.shade400,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _title;
  _NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: GoogleFonts.lato(fontSize: 25),
    );
  }
}

class _NoteText extends StatelessWidget {
  final String _text;
  _NoteText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: GoogleFonts.lato(
        color: Colors.grey.shade700,
      ),
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
    );
  }
}
