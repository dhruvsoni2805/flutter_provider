import 'package:flutter/material.dart';

class ThemeChangeProvider with ChangeNotifier {
  bool _theme = true;

  bool get theme => _theme;

  var _themeMode = ThemeMode.light;

  ThemeMode get thememode => _themeMode;

  void changeTheme() {
    _theme = !_theme;
    notifyListeners();
  }

  void setTheme(thememode) {
    _themeMode = thememode;
    notifyListeners();
  }
}
