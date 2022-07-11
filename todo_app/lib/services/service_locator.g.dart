// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_locator.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$ServiceLocator extends ServiceLocator {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => ThemeContextViewModel())
      ..registerFactory((c) => TasksViewModel(c<DatabaseContract>()))
      ..registerFactory((c) => TaskViewModel(c<DatabaseContract>()))
      ..registerFactory((c) => TaskDetailViewModel(c<DatabaseContract>()))
      ..registerSingleton<DatabaseContract>((c) => DatabaseProvider());
  }
}
