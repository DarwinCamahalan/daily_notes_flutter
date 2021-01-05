import 'package:daily_note/Screens/Blogs/my_blogs.dart';
import 'package:daily_note/Screens/Business/main.dart';
import 'package:daily_note/Screens/Home/components/body.dart';
import 'package:daily_note/Screens/Login/login_screen.dart';
import 'package:daily_note/Screens/Notes/my_notes.dart';
import 'package:daily_note/Screens/Webster/webster_screen.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(AboutUs());

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Us',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: Scaffold(
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
          title: Text(
            'About Us',
            style: GoogleFonts.lato(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
            child: Text('Add About Us Here'), // Add About Us
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
      ),
    );
  }
}
