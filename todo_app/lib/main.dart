import 'package:flutter/material.dart';
import 'package:todo_app/models/view_models/theme_context.dart';
import 'package:todo_app/services/app_bootsraper.dart';
import 'package:todo_app/services/app_router.dart';
import 'package:todo_app/ui/widgets/base_widget.dart';

void main() {
  AppBootStrapper.initialize();
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ThemeContextViewModel>(
      builder: (context, themeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ToDo App',
          theme: themeModel.lightThemeData(context),
          darkTheme: themeModel.darkThemeData(context),
          themeMode: themeModel.currentTheme(),
          initialRoute: '/home',
          onGenerateRoute: AppRouter.routeFactory,
        );
      },
    );
  }
}
