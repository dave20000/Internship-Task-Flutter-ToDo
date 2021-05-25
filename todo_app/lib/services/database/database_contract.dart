import 'package:todo_app/models/task.dart';

abstract class DatabaseContract {
  Future<List<Task>> getTasks();
  Future<int> add(Task task);
  Future<int> update(Task task);
}
