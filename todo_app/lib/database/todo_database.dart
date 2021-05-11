import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/task.dart';

class ToDoDatabase {
  ToDoDatabase._();
  static final ToDoDatabase db = ToDoDatabase._();

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

  Future<int> add(Task task) async {
    var dbClient = await database;
    return await dbClient.insert('tasks', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query('tasks');
    List<Task> tasks = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        tasks.add(Task.fromMap(maps[i]));
      }
    }
    return tasks;
  }

  Future<int> update(Task task) async {
    var dbClient = await database;
    return await dbClient.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<Task> getTaskById(int id) async {
    final db = await database;
    var res = await db.query("tasks", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Task.fromMap(res.first) : null;
  }

  Future close() async {
    var dbClient = await database;
    dbClient.close();
  }
}
