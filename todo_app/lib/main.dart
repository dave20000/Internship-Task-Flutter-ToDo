import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/router_service.dart';
import 'package:todo_app/view_models/theme_context_view_model.dart';
import 'package:todo_app/view_models/tasks_view_model.dart';

void main() {
  RoutingService.configureRoutes();
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeContextViewModel(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TasksViewModel(),
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
            onGenerateRoute: RoutingService.router.generator,
          );
        },
      ),
    );
  }
}
