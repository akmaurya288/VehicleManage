import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/DataBase/DriverModel.dart';



class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String noteTable='note_table';
  String coldId = 'driverID';
  String colname = 'driverName';
  String coladd= 'address';
  String colvid = 'vehicleID';
  String colPov = 'policeVeri';
  String colmed = 'medical';
  String colmob = 'mobno';
  String colexp = 'exp';
  String colexpiry='expiry';
  String colleave='leave';
  //vehical
  String vehicleTable='vehicle_table';
  String vcolplate='plateno';
  String vcoltype='type';
  String vcoldisCovered='distanceCovered';
  String vcollastFilledDate='lastFilleDate';
  String vcolavg='average';
  String vcolfuelCost='fuelCost';
  String vcolinCost='insuranceCost';
  String vcolinscompany='insuranceCompany';
  String vcolinsDueDate='insuranceDueDate';
  String vcolserviceType='serviceType';
  String vcolserviceCost='serviceCost';
  String vcolserviceDate='serviceDate';
  String vcolserviceWhat='serviceWhat';
  String vcolserviceWhere='serviceWhere';
  String vcolfitCost='fitnessCost';
  String vcolfitLast='fitnesslast';
  String vcolfitNextDate='fitnessNextDate';
  String vcolpollCost='pollutionCost';
  String vcolpollLast='pollutionlast';
  String vcolpollNextDate='pollutionNextDate';
  String vcoltaxCost='taxCost';
  String vcoltaxWhy='taxWhy';
  String vcoltaxDate='taxDate';
  String vcoltaxNextDate='taxNextDate';
  String vcoltaxtype='taxType';



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

    await db.execute('CREATE TABLE $noteTable($coldId INTEGER PRIMARY KEY, $colvid INTEGER,$colname TEXT, $coladd TEXT,'
        ' $colexp INTEGER, $colmed TEXT, $colPov TEXT, $colmob INTEGER, $colexpiry TEXT, $colleave TEXT)');
    
    await db.execute('CREATE TABLE $vehicleTable($colvid INTEGER PRIMARY KEY,$vcolplate INTEGER,$vcolavg INTEGER,$vcoldisCovered INTEGER,'
    '$vcolfitCost INTEGER,$vcolfitLast TEXT,$vcolfitNextDate TEXT,$vcolfuelCost INTEGER,$vcolinCost INTEGER,'
    '$vcolinscompany TEXT,$vcolinsDueDate TEXT,$vcolserviceCost INTEGER,$vcolserviceDate TEXT,$vcolserviceType TEXT'
    '$vcolserviceWhat TEXT,$vcolserviceWhere TEXT,$vcolpollCost INTEGER,$vcolpollLast TEXT,$vcolpollNextDate TEXT'
    '$vcoltaxCost INTEGER,$vcoltaxDate TEXT,$vcoltaxNextDate TEXT,$vcoltaxtype TEXT,$vcoltaxWhy TEXT,'
    'FOREIGN KEY($colvid)REFERENCES $noteTable($colvid))');
  }

  Future<List<Map<String, dynamic>>> getDriverMapList() async {

    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $noteTable order by $coldId ASC');
    return result;
  }
  //vehical
  Future<List<Map<String, dynamic>>> getVehicleMapList() async {

    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $vehicleTable order by $colvid ASC');
    return result;
  }
  Future<List<Map<String, dynamic>>> getVehiclePlateMapList() async {

    Database db = await this.database;
    var result = await db.rawQuery('SELECT $vcolplate,$colvid FROM $vehicleTable order by $colvid ASC');
    return result;
  }
  // Insert
  Future<int> insertDriverNote(DriverDB note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toDriverMap());
    return result;
  }
   // vehicalInsert
  Future<int> insertvehicleNote(DriverDB note) async {
    Database db = await this.database;
    var result = await db.insert(vehicleTable, note.toVehicleMap());
    return result;
  }
  // Update
  Future<int> updateDriverNote(DriverDB note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toDriverMap(), where: '$coldId= ?', whereArgs: [note.driverID]);
    return result;
  }
  Future<int> updatevehicleNote(DriverDB note) async {
    var db = await this.database;
    var result = await db.update(vehicleTable, note.toVehicleMap(), where: '$colvid= ?', whereArgs: [note.driverID]);
    return result;
  }
  // Delete
  Future<int> deleteDriverNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $coldId= $id');
    return result;
  }
  // Delete vehical
  Future<int> deletevehicalNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $vehicleTable WHERE $colvid= $id');
    return result;
  }
  // Future<int> getCount() async {
  // 	Database db = await this.database;
  // 	List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
  // 	int result = Sqflite.firstIntValue(x);
  // 	return result;
  // }
  Future<List<DriverDB>> getNoteList() async {
    var noteMapList = await getDriverMapList();
    int count = noteMapList.length;
    List<DriverDB> noteList = List<DriverDB>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(DriverDB.fromDriverMapObject(noteMapList[i]));
    }
    return noteList;
  }

  
  }