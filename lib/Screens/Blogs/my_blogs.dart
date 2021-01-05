import 'package:daily_note/Screens/About/main.dart';
import 'package:daily_note/Screens/Blogs/note_provider.dart';
import 'package:daily_note/Screens/Business/main.dart';
import 'package:daily_note/Screens/Home/components/body.dart';
import 'package:daily_note/Screens/Blogs/add_blogs.dart';
import 'package:daily_note/Screens/Login/login_screen.dart';
import 'package:daily_note/Screens/Notes/my_notes.dart';
import 'package:daily_note/Screens/Webster/webster_screen.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyBlogs());

class MyBlogs extends StatefulWidget {
  @override
  _MyBlogState createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlogs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.orange[100],
      ),
      title: 'Personal Blog',
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
            'Personal Blog',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/blog_background.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: FutureBuilder(
            future: BlogProvider.getBlogList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final blogs = snapshot.data;
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddBlogs(BlogMode.Editing, blogs[index])));
                        setState(() {});
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 5, left: 5),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/myblogs.jpg"),
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
                                  _BlogTitle(blogs[index]['title']),
                                  Container(
                                    height: 8,
                                  ),
                                  _BlogText(blogs[index]['text']),
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
                  itemCount: blogs.length,
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
                    builder: (context) => AddBlogs(BlogMode.Adding, null)));
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

class _BlogTitle extends StatelessWidget {
  final String _title;
  _BlogTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class _BlogText extends StatelessWidget {
  final String _text;
  _BlogText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: GoogleFonts.poppins(
        color: Colors.black,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
