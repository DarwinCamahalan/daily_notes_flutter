import 'package:daily_note/Screens/Home/components/body.dart';
import 'package:daily_note/Screens/Blogs/add_blogs.dart';
import 'package:daily_note/Screens/Blogs/inherited_widgets.dart';
import 'package:daily_note/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyBlogs());

class MyBlogs extends StatefulWidget {
  @override
  _MyBlogState createState() => _MyBlogState();
}

class _MyBlogState extends State<MyBlogs> {
  List<Map<String, String>> get _notes => BlogInheritedWidget.of(context).notes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Blog',
      home: Scaffold(
        backgroundColor: kPrimaryLightColor,
        drawer: new Drawer(
            child: Container(
                color: Colors.orangeAccent[100], child: new ListView())),
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Personal Blog',
            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddBlogs(BlogMode.Editing, index)));
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 5, left: 5),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/blog.png"),
                          fit: BoxFit.contain,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 13, right: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _BlogTitle(_notes[index]['title']),
                            Container(
                              height: 8,
                            ),
                            _BlogText(_notes[index]['text']),
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
            itemCount: _notes.length,
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
      style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
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
      style: GoogleFonts.lato(
        color: Colors.black,
      ),
    );
  }
}
