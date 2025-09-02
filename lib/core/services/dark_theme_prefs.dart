import 'shared_preferences_singleton.dart';

class DarkThemePrefs {
  static const String themeStatus = "THEMESTATUS";

  setDarkTheme(bool value) async {
    await Prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    return await Prefs.getBool(themeStatus);
  }
}
