import 'package:kiwi/kiwi.dart';
import 'package:todo_app/models/view_models/task.dart';
import 'package:todo_app/models/view_models/task_detail.dart';
import 'package:todo_app/models/view_models/tasks.dart';
import 'package:todo_app/models/view_models/theme_context.dart';
import 'package:todo_app/services/database/database_contract.dart';
import 'package:todo_app/services/database/database_provider.dart';

part 'service_locator.g.dart';

abstract class ServiceLocator {
  static KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    _$ServiceLocator()._configure();
  }

  static final resolve = container.resolve;

  @Register.singleton(ThemeContextViewModel)
  @Register.factory(TasksViewModel)
  @Register.factory(TaskViewModel)
  @Register.factory(TaskDetailViewModel)
  @Register.singleton(DatabaseContract, from: DatabaseProvider)
  void _configure();
}
