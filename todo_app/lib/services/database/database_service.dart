import 'package:todo_app/business_logic/models/task.dart';

abstract class DatabaseService {
  Future<List<Task>> getTasks();
  Future<int> add(Task task);
  Future<int> update(Task task);
}
