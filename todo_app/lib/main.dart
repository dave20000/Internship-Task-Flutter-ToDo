import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/view_models/tasks.dart';
import 'package:todo_app/models/view_models/theme_context.dart';
import 'package:todo_app/services/app_bootsraper.dart';
import 'package:todo_app/services/app_router.dart';
import 'package:todo_app/services/service_locator.dart';

void main() {
  AppBootStrapper.initialize();
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ServiceLocator.resolve<ThemeContextViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ServiceLocator.resolve<TasksViewModel>(),
        ),
      ],
      child: Consumer<ThemeContextViewModel>(
        builder: (context, customTheme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ToDo App',
            theme: customTheme.lightThemeData(context),
            darkTheme: customTheme.darkThemeData(context),
            themeMode: customTheme.currentTheme(),
            initialRoute: '/home',
            onGenerateRoute: AppRouter.routeFactory,
          );
        },
      ),
    );
  }
}
