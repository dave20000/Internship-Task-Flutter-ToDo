import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/route_config/application.dart';
import 'package:todo_app/route_config/routes.dart';
import 'package:todo_app/theme.dart';
import 'package:todo_app/viewModels/theme_context.dart';
import 'package:todo_app/viewModels/tasks.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeContext(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Tasks(),
        ),
      ],
      child: Consumer<ThemeContext>(
        builder: (context, customTheme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ToDo App',
            theme: lightThemeData(context),
            darkTheme: darkThemeData(context),
            themeMode: customTheme.currentTheme(),
            initialRoute: '/home',
            onGenerateRoute: Application.router.generator,
          );
        },
      ),
    );
  }
}
