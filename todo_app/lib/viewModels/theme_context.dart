import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeContext with ChangeNotifier {
  SharedPreferences _pref;
  final String darkThemeKey = "dark";
  final String lightThemeKey = "light";
  final String systemDefaultKey = "system";
  bool _isDark;
  bool _isSystem;
  bool _isLight;

  _initThemePrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadThemeTypeFromPrefes() async {
    await _initThemePrefs();
    _isDark = _pref.getBool(darkThemeKey) ?? false;
    _isLight = _pref.getBool(lightThemeKey) ?? false;
    _isSystem = _pref.getBool(systemDefaultKey) ?? true;
    notifyListeners();
  }

  _saveThemeToPrefs() async {
    await _initThemePrefs();
    _pref.setBool(darkThemeKey, _isDark);
    _pref.setBool(lightThemeKey, _isLight);
    _pref.setBool(systemDefaultKey, _isSystem);
  }

  ThemeContext() {
    _isLight = false;
    _isDark = false;
    _isSystem = true;
    _loadThemeTypeFromPrefes();
  }

  ThemeMode currentTheme() {
    return _isDark
        ? ThemeMode.dark
        : _isSystem
            ? ThemeMode.system
            : ThemeMode.light;
  }

  bool get isDark => _isDark;
  bool get isLight => _isLight;
  bool get isSystem => _isSystem;

  set isDark(bool isDark) {
    this._isDark = isDark;
  }

  set isLight(bool isLight) {
    this._isLight = isLight;
  }

  set isSystem(bool isSystem) {
    this._isSystem = isSystem;
  }

  void switchTheme() {
    currentTheme();
    _saveThemeToPrefs();
    notifyListeners();
  }
}
