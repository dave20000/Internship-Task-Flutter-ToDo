import 'package:flutter/cupertino.dart';
import 'package:todo_app/services/database/database_contract.dart';

import '../task.dart';

class TaskDetailViewModel with ChangeNotifier {
  Task task;
  DatabaseContract _databaseContract;
  bool _isEdited = false;

  TaskDetailViewModel(this._databaseContract);

  Future<void> fetchTask(int id) async {
    final val = await _databaseContract.getTaskById(id);
    task = val;
    notifyListeners();
  }

  bool get isEdited => _isEdited;

  set isEdited(bool val) {
    _isEdited = val;
    notifyListeners();
  }

  Future<void> deleteTask() async {
    await _databaseContract.deleteTask(task.id);
  }
}
