import 'package:todo_app/models/task.dart';

abstract class DatabaseContract {
  Future<List<Task>> getTasks();
  Future<int> add(Task task);
  Future<int> update(Task task);
  Future<Task?> getTaskById(int id);
  Future<int> deleteTask(int id);
}
