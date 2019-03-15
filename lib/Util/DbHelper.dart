import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/DataBase/DriverModel.dart';


class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String noteTable='note_table';
  String coldid = 'driverID';
  String colname = 'driverName';
  String coladd= 'address';
  String colvid = 'vehicalID';
  String colPov = 'policeVeri';
  String colmed = 'medical';
  String colmob = 'mobno';
  String colexp = 'exp';
  String colexpiry='expiry';
  String colleave='leave';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;

  }
  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'store.db';

    // Open/create the database at a given path

    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);

    return notesDatabase;

  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $noteTable($coldid INTEGER  KEY AUTOINCREMENT,$colname TEXT, $coladd TEXT,'
        ' $colexp INTEGER, $colmed TEXT, $colPov TEXT, $colmob INTEGER,$colexpiry TEXT,$colleave TEXT)');

  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {

    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $noteTable order by $coldid ASC');
    return result;
  }
  // Insert
  Future<int> insertNote(DriverDB note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }
  // Update
  Future<int> updateNote(DriverDB note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: '$coldid = ?', whereArgs: [note.driverID]);
    return result;
  }
  // Delete
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $coldid= $id');
    return result;
  }
  // Future<int> getCount() async {
  // 	Database db = await this.database;
  // 	List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
  // 	int result = Sqflite.firstIntValue(x);
  // 	return result;
  // }
  Future<List<DriverDB>> getNoteList() async {
    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;
    List<DriverDB> noteList = List<DriverDB>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(DriverDB.fromMapObject(noteMapList[i]));
    }
    return noteList;
  }

  }
