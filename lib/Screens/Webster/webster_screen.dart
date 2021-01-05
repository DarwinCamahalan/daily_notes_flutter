import 'dart:async';
import 'dart:convert';

import 'package:daily_note/Screens/About/main.dart';
import 'package:daily_note/Screens/Blogs/my_blogs.dart';
import 'package:daily_note/Screens/Business/main.dart';
import 'package:daily_note/Screens/Home/components/body.dart';
import 'package:daily_note/Screens/Login/login_screen.dart';
import 'package:daily_note/Screens/Notes/my_notes.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

void main() => runApp(Webster());

class Webster extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Webster',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _url = "https://owlbot.info/api/v4/dictionary/";
  String _token = "38fea3dba014b224d6b67cf343c7678bae07c774";

  TextEditingController _controller = TextEditingController();

  StreamController _streamController;
  Stream _stream;

  Timer _debounce;

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");
    Response response = await get(_url + _controller.text.trim(),
        headers: {"Authorization": "Token " + _token});
    _streamController.add(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  return MyNotes();
                                },
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.note),
                              Container(
                                width: 20,
                              ),
                              Text('All Notes',
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
                        padding:
                            const EdgeInsets.only(top: 15, bottom: 15, left: 5),
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
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("Mini Webster",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: Colors.white)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    onChanged: (String text) {
                      if (_debounce?.isActive ?? false) _debounce.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        _search();
                      });
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search for a word",
                      contentPadding: const EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  _search();
                },
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/webster_background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: _stream,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Text(
                      "Tap on Search Icon to find your\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tdesired word..."),
                );
              }

              if (snapshot.data == "waiting") {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data["definitions"].length,
                itemBuilder: (BuildContext context, int index) {
                  return ListBody(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: snapshot.data["definitions"][index]
                                      ["image_url"] ==
                                  null
                              ? null
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot
                                      .data["definitions"][index]["image_url"]),
                                ),
                          title: Text(
                              _controller.text.trim() +
                                  "(" +
                                  snapshot.data["definitions"][index]["type"] +
                                  ")",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            snapshot.data["definitions"][index]["definition"]),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
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
    );
  }
}
