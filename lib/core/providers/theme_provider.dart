import 'package:flutter/material.dart';

import '../services/shared_preferences_singleton.dart';

class ThemeProvider with ChangeNotifier {
  static const String themeStatus = "THEME_STATUS";
  //
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;

  ThemeProvider() {
    getTheme();
  }
  Future<void> setDarkTheme({required bool themeValue}) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    await Prefs.setBool(themeStatus, themeValue);
    _darkTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    _darkTheme = await Prefs.getBool(themeStatus);
    notifyListeners();
    return _darkTheme;
  }
}
