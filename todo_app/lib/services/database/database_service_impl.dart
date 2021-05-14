import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/business_logic/models/task.dart';
import 'package:todo_app/services/database/database_service.dart';

class DatabaseServiceImpl implements DatabaseService {
  /*DatabaseServiceImpl._();
  static final DatabaseServiceImpl db = DatabaseServiceImpl._();*/

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'todo.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, 
              details Text, taskDate Text, endDate Text,category Text)""");
  }

  Future<List<Task>> getTasks() async {
    try {
      var dbClient = await database;
      List<Map> maps = await dbClient.query('tasks');
      List<Task> tasks = [];
      if (maps.length > 0) {
        for (int i = 0; i < maps.length; i++) {
          tasks.add(Task.fromMap(maps[i]));
        }
      }
      return tasks;
    } catch (e) {
      close();
      throw Exception(e.toString());
    }
  }

  Future<int> add(Task task) async {
    try {
      var dbClient = await database;
      return await dbClient.insert('tasks', task.toMap());
    } catch (e) {
      close();
      throw Exception(e.toString());
    }
  }

  Future<int> update(Task task) async {
    try {
      var dbClient = await database;
      return await dbClient.update(
        'tasks',
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch (e) {
      close();
      throw Exception(e.toString());
    }
  }

  Future close() async {
    var dbClient = await database;
    dbClient.close();
  }
}
