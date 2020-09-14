import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:reminder/modal/event.dart';


class DatabaseHelper{
  static DatabaseHelper _databaseHelper;     
  static Database _database;
  String eventTable = 'event_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colLocation = 'location';
  String colDate = 'date';
  String colTime = 'time';

DatabaseHelper._createInstance();
  factory DatabaseHelper(){

    if(_databaseHelper==null){
    _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
// geter for database
Future<Database> get database async{
  if(_database == null){
     _database = await initilizeDatabase();

  }
return _database;
}

  Future <Database> initilizeDatabase()async{
   Directory directory= await getApplicationDocumentsDirectory();
   String path = directory.path+ 'events.db';
   var eventsDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
   return eventsDatabase;

  }
void _createDb(Database db,int newVersion)async{
  await db.execute('CREATE TABLE $eventTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXTt,' 
  '$colDescription TEXT, $colLocation TEXT, $colDate TEXT, $colTime TEXT)');
}
// Fetch
Future <List<Map<String,dynamic>>> getEventMapList()async{
  Database db= await this.database;
  // var result = await db.rawquery('SELECT * FROM $eventTable order by $colDate ADC');
  var result= await db.query(eventTable, orderBy: '$colDate ASC');
  return result;
}
// Insert Operation

Future <int> insertEvent(Event event)async{
  Database db = await this.database;
  var result= await db.insert(eventTable, event.toMap());
  return result;
}

Future<int> updateEvent(Event event)async{
  Database db = await this.database;
  var result = await db.update(eventTable, event.toMap(), where: '$colId = ?', whereArgs: [event.id] );
  return result;
}

Future<int> deleteEvent(int id)async{
  var db = await this.database;
  int result = await db.rawDelete('DELETE FROM $eventTable WHERE $colId =$id');
  return result;
}

Future<int> getCount()async{
  Database db = await this.database;
  List<Map<String,dynamic>> x= await db.rawQuery('SELECT COUNT (*) from $eventTable');
  int result = Sqflite.firstIntValue(x);
  return result;


}
Future<List<Event>> getEventList()async{
  var eventMapList= await getEventMapList();
  int count = eventMapList.length;

  List<Event> eventList = List<Event>();
  for (int i= 0;i<count; i++){
    eventList.add(Event.formMapObject(eventMapList[i]));
  }
  return eventList;  
}






}