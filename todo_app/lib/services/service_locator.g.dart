// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_locator.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$ServiceLocator extends ServiceLocator {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => ThemeContextViewModel());
    container.registerFactory((c) => TasksViewModel());
    container.registerSingleton<DatabaseContract>((c) => DatabaseProvider());
  }
}
