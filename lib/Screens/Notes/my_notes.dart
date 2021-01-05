import 'package:daily_note/Screens/About/main.dart';
import 'package:daily_note/Screens/Blogs/my_blogs.dart';
import 'package:daily_note/Screens/Business/main.dart';
import 'package:daily_note/Screens/Home/components/body.dart';
import 'package:daily_note/Screens/Login/login_screen.dart';
import 'package:daily_note/Screens/Notes/add_notes.dart';
import 'package:daily_note/Screens/Notes/note_provider.dart';
import 'package:daily_note/Screens/Webster/webster_screen.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyNotes());

class MyNotes extends StatefulWidget {
  @override
  _MyNotesState createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.orange[100],
      ),
      title: 'My Notes',
      home: Scaffold(
        backgroundColor: kPrimaryLightColor,
        drawer: new Drawer(
            child: Container(
                color: kPrimaryLightColor,
                child: new ListView(
                  children: [
                    new Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            new UserAccountsDrawerHeader(
                              decoration: BoxDecoration(color: Colors.white),
                              accountName: new Text(
                                'User',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              accountEmail: new Text('example@gmail.com'),
                              currentAccountPicture: new CircleAvatar(
                                radius: 50.0,
                                backgroundColor: const Color(0xFF778899),
                                backgroundImage: NetworkImage(
                                    "https://cdn1.iconfinder.com/data/icons/avatars-1-5/136/87-512.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MyBlogs();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.notes),
                                Container(
                                  width: 20,
                                ),
                                Text('All  Blogs',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Webster();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.book),
                                Container(
                                  width: 20,
                                ),
                                Text('Mini Webster',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Business();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today),
                                Container(
                                  width: 20,
                                ),
                                Text('Business',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AboutUs();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.info_outline_rounded),
                                Container(
                                  width: 20,
                                ),
                                Text('About Us',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 272,
                      ),
                      Container(
                        color: kPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreen();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.exit_to_app_sharp,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: 20,
                                ),
                                Text('Logout',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ))),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: kPrimaryColor,
          title: Text(
            'My Notes',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/note_background.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: FutureBuilder(
            future: NoteProvider.getNoteList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final notes = snapshot.data;
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddNotes(NoteMode.Editing, notes[index])));
                        setState(() {});
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 5, left: 5),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/paper1.png"),
                                fit: BoxFit.fill,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, right: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _NoteTitle(notes[index]['title']),
                                  Container(
                                    height: 8,
                                  ),
                                  _NoteText(notes[index]['text']),
                                  Container(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: notes.length,
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
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
      style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: TextAlign.justify,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
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
      style: GoogleFonts.poppins(
        color: Colors.grey.shade900,
      ),
      textAlign: TextAlign.justify,
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
    );
  }
}
