import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/services/database/database_contract.dart';

class DatabaseProvider implements DatabaseContract {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
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
      List<Map<String, dynamic>> jsonTasks = await dbClient.query('tasks');
      List<Task> tasks = [];
      if (jsonTasks.length > 0) {
        for (int i = 0; i < jsonTasks.length; i++) {
          tasks.add(Task.fromJson(jsonTasks[i]));
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
      return await dbClient.insert('tasks', task.toJson());
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
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch (e) {
      close();
      throw Exception(e.toString());
    }
  }

  Future<Task?> getTaskById(int id) async {
    try {
      final db = await database;
      List<Map<String, dynamic>> taskJson =
          await db.query("tasks", where: "id = ?", whereArgs: [id]);
      return taskJson.isNotEmpty ? Task.fromJson(taskJson.first) : null;
    } catch (e) {
      close();
      throw Exception(e.toString());
    }
  }

  Future<int> deleteTask(int id) async {
    try {
      final db = await database;
      int count = await db.delete("tasks", where: 'id = ?', whereArgs: [id]);
      return count;
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
