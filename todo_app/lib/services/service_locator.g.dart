// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_locator.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$ServiceLocator extends ServiceLocator {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<DatabaseService>((c) => DatabaseServiceImpl());
    container.registerSingleton<RouterService>((c) => RouterServiceImpl());
  }
}
