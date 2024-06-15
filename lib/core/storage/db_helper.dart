import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './end_points.dart';

class DbHelper {
  static Database? _db;

  // DBHelper._();

  Future<Database?> get db async {
    // ignore: prefer_conditional_assignment
    if (_db == null) {
      _db = await initialDb();
    }
    return _db;
  }

  Future<Database> initialDb() async {
    debugPrint('*********** Starting init Database ***********');
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'travel.db');
    final Database db = await openDatabase(
      path,
      onCreate: createDB,
      version: 2,
      onUpgrade: upgradeDB,
    );
    return db;
  }

  Future upgradeDB(Database db, int version, int last) async {}


  Future createDB(Database db, int version) async {
    final Batch batch = db.batch();

    batch.execute('''
    CREATE TABLE $CATEGORIES_TABLE (
      $ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $NAME TEXT
      )
    ''');

    batch.execute('''
    CREATE TABLE $PLACES_TABLE (
      $ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $NAME TEXT,
      $IMAGE TEXT,
      $RATE REAL,
      $REVIEWERS INTEGER,
      $IS_FAV INTEGER,
      $DESCRIPTION TEXT,
      $LABEL TEXT,
      $PRICE REAL,
      $REASON TEXT,
      $CATEGORY_ID INTEGER NOT NULL,
      FOREIGN KEY ($CATEGORY_ID) REFERENCES $CATEGORIES_TABLE ($ID) ON DELETE NO ACTION ON UPDATE NO ACTION
      )
    ''');

    batch.execute('''
    CREATE TABLE $FACILITIES_TABLE (
      $ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $NAME TEXT,
      $IMAGE TEXT
      )
    ''');

    batch.execute('''
    CREATE TABLE $PLACE_FACILITIES_TABLE (
      $ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $PLACE_ID INTEGER NOT NULL,
      $FACILITY_ID INTEGER NOT NULL,
      FOREIGN KEY ($PLACE_ID) REFERENCES $PLACES_TABLE ($ID),
      FOREIGN KEY ($FACILITY_ID) REFERENCES $FACILITIES_TABLE ($ID)
      )
    ''');

    await batch.commit();
    debugPrint('*********** Database Created Successfully ***********');
  }

  static Future<void> insert({required final String sql}) async {
    try {
      await _db!.rawInsert(sql);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<Map<String, dynamic>>> select({
    required final String sql,
  }) async {
    try {
      List<Map<String, dynamic>> response = await _db!.rawQuery(sql);
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<void> update({
    required final String sql,
    // required final List args,
  }) async {
    try {
      await _db!.rawUpdate(sql);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> delete({required final String sql}) async {
    try {
      await _db!.delete(sql);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}