import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BlogProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'blogs.db'),
        version: 1, onCreate: (Database db, int version) async {
      db.execute('''
        create table Blogs(
          id integer primary key autoincrement,
          title text not null,
          text text not null
        );
        ''');
    });
  }

  static Future<List<Map<String, dynamic>>> getBlogList() async {
    if (db == null) {
      await open();
    }

    return await db.query('Blogs');
  }

  static Future insertBlog(Map<String, dynamic> note) async {
    await db.insert('Blogs', note);
  }

  static Future updateBlog(Map<String, dynamic> note) async {
    await db.update('Blogs', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future deleteBlog(int id) async {
    await db.delete('Blogs', where: 'id = ?', whereArgs: [id]);
  }
}
