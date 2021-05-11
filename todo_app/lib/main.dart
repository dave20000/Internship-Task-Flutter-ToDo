import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/route_config/application.dart';
import 'package:todo_app/route_config/routes.dart';
import 'package:todo_app/viewModels/bottom_nav_bar_viewmodel.dart';
import 'package:todo_app/viewModels/theme_context.dart';
import 'package:todo_app/viewModels/tasks.dart';
import 'package:todo_app/screens/home_screen.dart';

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
          ChangeNotifierProvider(create: (ctx) => Tasks()),
        ],
        child: Consumer<ThemeContext>(
          builder: (context, customTheme, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ToDo App',
              theme: ThemeData.light().copyWith(
                  accentColor: Colors.yellowAccent[700],
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black),
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(color: Colors.black)),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.yellowAccent[700],
                      foregroundColor: Colors.white),
                  primaryTextTheme: TextTheme(
                    headline6: TextStyle(fontSize: 16.0, color: Colors.black54),
                    headline4: TextStyle(fontSize: 16.0, color: Colors.white),
                    subtitle1: TextStyle(fontSize: 16.0, color: Colors.black45),
                  ),
                  textTheme: TextTheme(
                    headline1: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    headline2: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    headline3: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    headline5: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    button: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              darkTheme: ThemeData.dark().copyWith(
                  accentColor: Colors.yellowAccent[700],
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  backgroundColor: Colors.black,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(color: Colors.white)),
                  iconTheme: IconThemeData(color: Colors.white),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.yellowAccent[700],
                      foregroundColor: Colors.black),
                  primaryTextTheme: TextTheme(
                    headline6: TextStyle(fontSize: 16.0, color: Colors.white),
                    headline4: TextStyle(fontSize: 16.0, color: Colors.black),
                    subtitle1: TextStyle(fontSize: 16.0, color: Colors.white54),
                  ),
                  textTheme: TextTheme(
                    headline1: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    headline2: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    headline3: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    headline5: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    button: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              themeMode: customTheme.currentTheme(),
              home: ChangeNotifierProvider<BottomNavigationBarViewModel>(
                  create: (ctx) => BottomNavigationBarViewModel(),
                  child: HomeScreen()),
              //home: HomeScreen(),
              //initialRoute: '/home',
              onGenerateRoute: Application.router.generator,
            );
          },
        ));
  }
}
