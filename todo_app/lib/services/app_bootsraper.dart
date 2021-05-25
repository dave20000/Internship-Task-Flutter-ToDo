import 'package:todo_app/services/app_router.dart';
import 'package:todo_app/services/service_locator.dart';

class AppBootStrapper {
  static void initialize() {
    ServiceLocator.setup();
    AppRouter.configureRoutes();
  }
}
