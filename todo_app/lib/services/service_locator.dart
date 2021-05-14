import 'package:kiwi/kiwi.dart';
import 'package:todo_app/services/database/database_service.dart';
import 'package:todo_app/services/database/database_service_impl.dart';
import 'package:todo_app/services/route_config/router_service.dart';
import 'package:todo_app/services/route_config/router_service_impl.dart';

part 'service_locator.g.dart';

abstract class ServiceLocator {
  static KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    _$ServiceLocator()._configure();
  }

  static final resolve = container.resolve;

  @Register.singleton(DatabaseService, from: DatabaseServiceImpl)
  @Register.singleton(RouterService, from: RouterServiceImpl)
  void _configure();
}
