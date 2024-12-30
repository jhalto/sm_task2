import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sm_task2/models/Photo.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> initDatabase() async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'photos.db');
    _database = await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
    return _database!;
  }

  static Future<void> _onCreate(Database db, int version) async {
    const sql = '''
      CREATE TABLE photos (
        albumId INTEGER,
        id INTEGER PRIMARY KEY,
        title TEXT,
        url TEXT,
        thumbnailUrl TEXT
      )
    ''';
    await db.execute(sql);
  }

  static Future<void> createPhoto(Photo photo) async {
    final db = await initDatabase();
    await db.insert(
      'photos',
      photo.toJson(),
    );
  }

  static Future<List<Photo>> readPhoto() async {
    final db = await initDatabase();
    final photosData = await db.query('photos');
    return photosData.isNotEmpty
        ? photosData.map((e) => Photo.fromJson(e)).toList()
        : [];
  }

  static Future<void> clearPhotos() async {
    final db = await initDatabase();
    await db.delete('photos');
  }
}
