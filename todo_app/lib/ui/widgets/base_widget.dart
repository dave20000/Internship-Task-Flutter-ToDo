/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/service_locator.dart';

class BaseWidget<T> extends StatelessWidget {

  final Widget Function(BuildContext context, T value, Widget child) builder;

  BaseWidget({this.builder});
  
  final T model = ServiceLocator.resolve<T>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: builder),
    );
  }

}*/
