import 'package:daily_note/Screens/Blogs/main.dart';
import 'package:daily_note/Screens/Business/business_screen.dart';
import 'package:daily_note/Screens/Notes/main.dart';
import 'package:daily_note/Screens/Webster/webster_screen.dart';
import 'package:flutter/material.dart';
import 'package:daily_note/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      title: 'Dashboard',
      home: Scaffold(
        drawer: new Drawer(
            child: Container(
                color: Colors.orangeAccent[100], child: new ListView())),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Dashboard',
            style: GoogleFonts.lato(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: Container(
          margin: const EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: new MaterialButton(
                        minWidth: 100,
                        height: 150,
                        color: new Color.fromRGBO(255, 70, 67, 0.7),
                        splashColor: Colors.orange,
                        textColor: Colors.black,
                        elevation: 8.0,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/add.png'),
                                fit: BoxFit.contain),
                          ),
                          padding: const EdgeInsets.all(33),
                          child: Text(
                            "  Add \nNotes",
                            style: GoogleFonts.viga(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                      // bottomLeft
                                      offset: Offset(-0.3, -0.3),
                                      color: Colors.black),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(0.3, -0.3),
                                      color: Colors.black),
                                  Shadow(
                                      // topRight
                                      offset: Offset(0.3, 0.3),
                                      color: Colors.black),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-0.3, 0.3),
                                      color: Colors.black),
                                ]),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MainScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: new MaterialButton(
                        minWidth: 150,
                        height: 150,
                        textColor: Colors.black,
                        color: new Color.fromRGBO(0, 255, 178, 0.7),
                        splashColor: Colors.orange,
                        elevation: 8.0,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/blog.png'),
                                fit: BoxFit.fill),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Personal \n   Blogs",
                              style: GoogleFonts.viga(
                                  fontSize: 24.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        // bottomLeft
                                        offset: Offset(-0.3, -0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // bottomRight
                                        offset: Offset(0.3, -0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // topRight
                                        offset: Offset(0.3, 0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // topLeft
                                        offset: Offset(-0.3, 0.3),
                                        color: Colors.black),
                                  ]),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BlogMainScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: new MaterialButton(
                        minWidth: 150,
                        height: 150,
                        color: new Color.fromRGBO(0, 221, 255, 0.7),
                        splashColor: Colors.orange,
                        textColor: Colors.black,
                        elevation: 8.0,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/webster.png'),
                                fit: BoxFit.fill),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "   Mini \nWebster",
                              style: GoogleFonts.viga(
                                  fontSize: 27,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        // bottomLeft
                                        offset: Offset(-0.3, -0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // bottomRight
                                        offset: Offset(0.3, -0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // topRight
                                        offset: Offset(0.3, 0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // topLeft
                                        offset: Offset(-0.3, 0.3),
                                        color: Colors.black),
                                  ]),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Webster();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: new MaterialButton(
                        minWidth: 150,
                        height: 150,
                        color: new Color.fromRGBO(255, 255, 69, 0.7),
                        splashColor: Colors.orange,
                        textColor: Colors.black,
                        elevation: 8.0,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/business.png'),
                                fit: BoxFit.fill),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "  \nBusiness\n  ",
                              style: GoogleFonts.viga(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        // bottomLeft
                                        offset: Offset(-0.3, -0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // bottomRight
                                        offset: Offset(0.3, -0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // topRight
                                        offset: Offset(0.3, 0.3),
                                        color: Colors.black),
                                    Shadow(
                                        // topLeft
                                        offset: Offset(-0.3, 0.3),
                                        color: Colors.black),
                                  ]),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Business();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
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
