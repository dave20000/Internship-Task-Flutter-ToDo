import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeContext with ChangeNotifier {
  bool _isDark = false;
  bool _isSystem = true;
  bool _isLight = false;
  ThemeMode currentTheme() {
    return _isDark
        ? ThemeMode.dark
        : _isSystem
            ? ThemeMode.system
            : ThemeMode.light;
  }

  bool get isDark {
    return _isDark;
  }

  set isDark(bool isDark) {
    this._isDark = isDark;
  }

  bool get isLight {
    return _isLight;
  }

  set isLight(bool isLight) {
    this._isLight = isLight;
  }

  bool get isSystem {
    return _isSystem;
  }

  set isSystem(bool isSystem) {
    this._isSystem = isSystem;
  }

  void switchTheme() {
    currentTheme();
    notifyListeners();
  }
}
